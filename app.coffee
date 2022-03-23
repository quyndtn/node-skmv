express         = require 'express'
mongoose        = require 'mongoose'
http              = require 'http'
path            = require 'path'
_                             = require 'lodash'
request                       = require 'request'
fibrous                       = require 'fibrous'

port =  8080

# INIT app
app  = express()

# View Engine
app.set 'view engine', 'pug'
app.set 'views', path.join(__dirname, 'views')
app.set 'trust proxy', true
http = http.Server(app)


# Home route
app.get '/ip', (req, res) -> res.render('index')
# app.get '/', (req, res) -> res.json 'Hello'

app.get '/', (req, res, callback) ->
  try
    ip = '1.54.252.100'
    # ipinfo = request.get "http://ipinfo.io/#{ip}", (error, response, body) ->
    #   if err? then return callback err
    #   return callback(null, response)

    
    # res.json ipinfo

    fibrous.run () ->
      ip = '1.54.252.100'
    , (error, result) ->
        if error? then return callback error
        res.json result
        
  catch e then return callback e

# start server
http.listen port, () -> console.log "Express server listening on PORT #{port}"
module.exports = http
