Peaches = require 'peaches'
cssbeautify = require 'cssbeautify'

exports.install = (app) ->
  app.get '/api', (req, res, next)->
    res.redirect('/')

  app.post '/api', (req, res, next)->
    res.locals.styleText = req.body.styleText
    res.locals.spriteName = req.body.spriteName
    res.locals.model = req.body.model
    res.locals.format = req.body.format
    res.locals.sort = req.body.sort

    if req.body.retina && req.body.retina != 'false'
      res.locals.retina = true
    else
      res.locals.retina = false

    if req.body.beautify && req.body.beautify != 'false'
      res.locals.beautify = true;
    else
      res.locals.beautify = false;

    next()
  , (req, res, next)->
    peaches = new Peaches res.locals.styleText, {
      'server':
        "name": "local",
        "root": app.settings.CLOUD.root,
        "tmp": app.settings.CLOUD.tmp,
        "baseURI": app.settings.CLOUD.static_url
      'format': res.locals.format,
      'sort': res.locals.sort,
      'retina': res.locals.retina
    }, (errs, styleText)->
      if errs
        res.locals.errors = errs;
        return next();
      res.locals.styleText = styleText
      images = []
      images.push val for key,val of @tokenList

      images.push val for key,val of @retinaTokenList

      res.locals.images = images
      next()
  , (req, res, next)->
    if res.locals.errors
      return res.json {
        stat: 'fail'
        errors: res.locals.errors
      }
    next()
  , (req, res, next)->
    if res.locals.beautify
      res.locals.styleText = cssbeautify res.locals.styleText

    next()
  , (req, res, next)->
    res.json {
      stat: 'ok'
      styleText: res.locals.styleText,
      images: res.locals.images
    }