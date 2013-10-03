path = require 'path'

_ = require 'underscore'

DOMAIN = 'peaches.net'

settings =
  PROJ_ROOT: path.join __dirname, ''
  ROOT_DIR: path.join __dirname, ''
  APP_ROOT: path.join __dirname, 'apps'
  STATIC_ROOT: path.join __dirname, 'static'
  STATIC_URL: "http://static.peaches.net/"
  STATIC_CDN_URL: 'http://sliuqin.github.io/assets/'
  port: 8085
  views: path.join __dirname, 'template'
  INSTALLED_APPS: ['default']
  DOMAIN: DOMAIN
  ROOT_URL: "http://#{DOMAIN}/"
  ASSETS_URL: "http://assets.#{DOMAIN}/"
  OAUTH_URL: "http://oauth.#{DOMAIN}/",
  CLOUD_URL: "http://cloud.#{DOMAIN}/"
  CLOUD:
    root: path.join __dirname, 'static/cloud/root'
    tmp: path.join __dirname, 'static/cloud/tmp'
    static_url:"http://cloud.#{DOMAIN}/static/cloud/root/"

settings.uploadDir = path.join(settings.STATIC_ROOT, 'upload')

for key ,val of settings
  exports[key] = val
