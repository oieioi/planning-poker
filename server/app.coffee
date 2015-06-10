express      = require 'express'
path         = require 'path'
logger       = require 'morgan'
bodyParser   = require 'body-parser'
cookieParser = require 'cookie-parser'

routes = require './routes/index'
users  = require './routes/users'
rooms  = require './routes/rooms'

app = do express


app.use logger 'dev'
app.use do bodyParser.json
app.use bodyParser.urlencoded {extended : false}
app.use do cookieParser

app.use '/api/users', users
app.use '/api/rooms', rooms

app.use express.static path.join __dirname, 'public'

app.use (req, res, cb) ->
  err = new Error 'Not Found'
  err.status = 404
  cb err

server = app.listen 3000, ->
  host = server.address().address
  port = server.address().port

  console.log 'app listening at http://%s:%s', host, port

module.extended = app
