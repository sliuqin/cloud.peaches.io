Peaches = require 'peaches'

exports.install = (app) ->
  app.get '/try', (req, res, next)->
    next()
  , (req, res, next)->
    res.render 'apps/default/try.html'