FROM node:18-alpine

WORKDIR /usr/src/api

# Set env
ENV NODE_VERSION 18

RUN npm install -g concurrently

# Install dependencies based on the preferred package manager
COPY package.json yarn.lock* package-lock.json* .pnpm-lock.yaml* ./

RUN \
  if [ -f yarn.lock ]; then yarn global add concurrently; \
  elif [ -f package-lock.json ]; then npm install -g concurrently; \
  elif [ -f pnpm-lock.yaml ]; then yarn global add concurrently; \
  else npm install -g concurrently; \
  fi

RUN \
  if [ -f yarn.lock ]; then yarn --frozen-lockfile; \
  elif [ -f package-lock.json ]; then npm ci; \
  elif [ -f pnpm-lock.yaml ]; then yarn global add pnpm && pnpm i; \
  # Allow install without lockfile, so example works even without Node.js installed locally \
  else echo "Warning: Lockfile not found. It is recommended to commit lockfiles to version control." && npm install; \
  fi

# Start the api
CMD \
  if [ -f yarn.lock ]; then yarn dev; \
  elif [ -f package-lock.json ]; then npm run dev; \
  elif [ -f pnpm-lock.yaml ]; then pnpm dev; \
  else npm run dev; \
  fi
