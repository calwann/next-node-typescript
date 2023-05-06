# Next Node Typescript stack
This service provides a powerful stack with NextJS NodeJS using typescript and Nginx with a reverse proxy

## Requirements
You will need to install [Docker](https://www.docker.com/products/docker-desktop/) to run this application using containers.
You will need to install [Node/NPM](https://nodejs.org/en/) to execute npm commands.

## Setup
First clone this repository, then from a terminal go to the project directory by running the following command

Copy `.env.example` to `.env`

```shell
$ cp ./api/.env.example ./api/.env
```
```shell
$ cp ./app/.env.example ./app/.env
```

Execute the NPM command to build the containers and start the applications

```shell
$ npm start
```

## Usage
Navigate to this url to access the client-side (Next) system [http://localhost/](http://localhost/)
Navigate to this url to access the server-sid (Node) system [http://localhost/api](http://localhost/api)

## After usage
Stop the containers using this command
```shell
$ npm stop
```
