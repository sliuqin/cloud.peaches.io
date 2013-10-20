path = require 'path'

_ = require 'underscore'

DOMAIN = 'peaches.io'

settings =
  port: 9001
  ROOT_URL: "http://#{DOMAIN}/"
  STATIC_URL: "http://static.#{DOMAIN}/"
  ASSETS_URL: "http://assets.#{DOMAIN}/"
  OAUTH_URL: "http://oauth.#{DOMAIN}/"
  CLOUD_URL: "http://cloud.#{DOMAIN}/"
  PHOTO_URL: "http://photo.#{DOMAIN}/"
  ALBUM_URL: "http://album.#{DOMAIN}/"
  CLOUD:
    root: path.join __dirname, 'static/cloud/root'
    tmp: path.join __dirname, 'static/cloud/tmp'
    static_url:"http://cloud.#{DOMAIN}/static/cloud/root/"
for key ,val of settings
  exports[key] = val 