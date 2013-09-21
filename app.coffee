path = require('path');
EventEmitter = require('events').EventEmitter;
express = require('express');
swig = require('swig');
cons = require('consolidate');


class Manage extends EventEmitter
  @instance: null
  constructor: (@name)->
    return @instance if @instance

    @instance = this;
    @_init();

  @getInstance: ->
    @instance = if @instance then @instance else new Manage;

  _init: ->
    @logger = require('tracer').dailyfile({
      root: path.join(__dirname, 'logs')
    })
    @settings = require('./settings')
    @server = express()

    @server.configure 'all', ->
      this.engine 'html', cons.swig
      swig.init({
        allowErrors: false
        autoescape: true
        cache: false
        encoding: 'utf8'
        root: @settings.views
        tags: {}
        extensions: {}
        tzOffset: 0
      });
      this.set 'view engine', 'html'
      this.set 'view options', {
        layout: false
      }
      this.set key, val for key ,val of @settings

      this.use express.bodyParser({
        keepExtensions: true,
        uploadDir: @settings.uploadDir
      })

      this.use express.methodOverride()


  run: ->
    APP_ROOT = @settings.APP_ROOT;
    server = @server
    @logger.debug "installed apps:#{@settings.INSTALLED_APPS}"
    @settings.INSTALLED_APPS.forEach (app)->
      app = require path.join(APP_ROOT, app)
      view.install server for key, view of app.views if app.views

    @server.listen @settings.port
    @logger.info "server is run on #{@settings.port}"


if (!module.parent)
  manage = Manage.getInstance();
  manage.run()
  