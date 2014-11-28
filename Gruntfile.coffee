###
grunt-styledocco
https://github.com/weareinteractive/grunt-styledocco

Copyright (c) 2013 We Are Interactive
Licensed under the MIT license.
###

module.exports = (grunt) ->
  "use strict"

  # Project configuration.
  grunt.initConfig
    pkg: grunt.file.readJSON "package.json"

    coffeelint:
      files: ["Gruntfile.coffee", "tasks/**/*.coffee", "test/**/*.coffee"]
      options:
        max_line_length:
          value: 200
          level: "error"

    clean:
      test:
        src: ["test/tmp/*"]

    # Run for unit tests
    styledocco:
      test:
        options:
          name: "<%= pkg.name %> v<%= pkg.version %>"
          cmd: "node_modules/.bin/styledocco"
        files: [
          "test/tmp": "test/fixtures"
        ]

    # Unit tests.
    mochacov:
      options:
        bail: true
        ui: 'exports'
        require: 'coffee-script'
        compilers: ['coffee:coffee-script/register']
        files: 'test/specs/**/*.coffee'
      all:
        options:
          reporter: 'spec'

    # Deployment
    bumper:
      options:
        push: false
        createTag: false
        tasks: ["default"]
        files: ["package.json"]
        updateConfigs: ["pkg"]

  # Actually load this plugin's task(s).
  grunt.loadTasks "tasks"

  # Load npm tasks
  grunt.loadNpmTasks "grunt-coffeelint"
  grunt.loadNpmTasks "grunt-contrib-clean"
  grunt.loadNpmTasks "grunt-mocha-cov"
  grunt.loadNpmTasks "grunt-bumper"

  # Tasks
  grunt.registerTask "default", ["coffeelint"]
  grunt.registerTask "test", ["default", "clean", "styledocco", "mochacov"]
