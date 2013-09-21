exports.install = (app) ->
  app.get '/', (req, res, next)->
    res.send 'send'
  , (req, res, next) ->
    res.send 'send'