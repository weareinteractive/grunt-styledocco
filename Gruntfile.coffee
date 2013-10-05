module.exports = (grunt) ->

  grunt.initConfig
    pkg: grunt.file.readJSON "package.json"

    coffeelint:
      files: ["Gruntfile.coffee", "test/**/*.coffee"]
      options:
        max_line_length:
          value: 200
          level: "error"

    coffee:
      tasks:
        options:
          bare: true
        files:
          'tasks/styledocco.js': 'src/styledocco.coffee'

    clean:
      test:
        src: ["docs"]

    styledocco:
      test:
        options:
          name: '<%= pkg.name %> v<%= pkg.version %>'
        files: [
          'docs': 'test/fixtures/structured.css'
        ]

    mochaTest:
      test:
        options:
          bail: true
          ui: 'exports'
          timeout: 10000
        src: ['test/specs/**/*.test.coffee']

    bump:
      options:
        pushTo: 'origin'
        commitFiles: ['-a']
        updateConfigs: ['pkg']
        files: ['package.json']

  # Actually load this plugin's task(s).
  grunt.loadTasks "tasks"

  # Load npm tasks
  grunt.loadNpmTasks "grunt-mocha-test"
  grunt.loadNpmTasks "grunt-coffeelint"
  grunt.loadNpmTasks "grunt-styledocco"
  grunt.loadNpmTasks "grunt-contrib-clean"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-bump"

  # Register tasks
  grunt.registerTask 'default', ['coffeelint', 'coffee']
  grunt.registerTask 'test', ['default', 'clean', 'styledocco', 'mochaTest']
