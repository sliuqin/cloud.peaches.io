module.exports = (grunt) ->
  grunt.initConfig {
    pkg: grunt.file.readJSON 'package.json'
    uglify:
      options:
        banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
      build:
        src: 'static/js/src/<% pkg.name %>.coffee'
        dest: 'static/js/build/<% pkg.name %>.min.js'
    less:
      development:
        options:
          paths: ["static/css"],
          yuicompress: true
        files:
          'static/css/dest/cloud.css': ['static/css/semantic/0.1.0/semantic.css',
                                        'static/css/src/cloud/index.less']
    coffee:
      complie:
        files:
          'static/js/dest/hello.js': ['static/js/src/*.coffee']
    watch:
      css:
        files: ['static/css/src/cloud/*.less']
        tasks: ['less']
      scripts:
        files: ['static/js/src/*.coffee']
        tasks: ['coffee']
  }
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.registerTask 'default', ['coffee', 'less']