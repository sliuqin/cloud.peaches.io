Peaches = require 'peaches'

exports.install = (app) ->
  app.get '/api', (req, res, next)->
    res.send 'sendxcccxx'
  , (req, res, next) ->
    res.send 'send coffee xx'