Peaches = require 'peaches'
fs = require 'fs'
path = require 'path'
exports.install = (app) ->
  testDir = path.join app.settings.PROJ_ROOT, 'static/test'
  app.get '/', (req, res, next)->
    res.locals.action = "http://#{req.headers.host}#{req.headers.uri}"
    fs.readdir testDir, (err, files)->
      res.locals.files = files
      next()
  , (req, res, next)->
    res.locals.file = req.query.file
    res.locals.file = res.locals.files[0] if res.locals.files.indexOf(res.locals.file) < 0
    fs.readFile path.join(testDir, res.locals.file), (err, content)->
      res.locals.content = content.toString()
      next()

  , (req, res, next)->
    res.render 'apps/default/index.html'