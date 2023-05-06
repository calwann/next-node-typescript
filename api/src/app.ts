import bodyParser from 'body-parser'
import compression from 'compression' // compresses requests
import express from 'express'
import path from 'path'

// Controllers (route handlers)
import * as homeController from './controllers/home'

// Create Express server
const app = express()

// Express configuration
app.set('port', process.env.PORT != null || 3001)
app.set('views', path.join(__dirname, '../views'))
app.set('view engine', 'pug')
app.use(compression())
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: true }))

app.use(express.static(path.join(__dirname, 'public'), { maxAge: 31557600000 }))

/**
 * Primary app routes.
 */
app.get('/api/', homeController.index)

export default app
