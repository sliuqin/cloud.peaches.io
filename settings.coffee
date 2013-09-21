path = require 'path'

_ = require 'underscore'
APP_THEME = 'default'

settings =
  PROJ_ROOT: path.join __dirname, ''
  ROOT_DIR: path.join __dirname, ''
  APP_ROOT: path.join __dirname, 'apps'
  STATIC_ROOT: path.join __dirname, 'static'
  port: 8084
  views: path.join __dirname, 'template', APP_THEME
  INSTALLED_APPS: ['default']

settings.uploadDir = path.join(settings.STATIC_ROOT, 'upload')

for key ,val of settings
  exports[key] = val

