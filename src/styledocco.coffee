###
grunt-styledocco
https://github.com/weareinteractive/grunt-styledocco

Copyright (c) 2013 We Just Do Stuff, Kim & Pollak GbR under the MIT license.
###

"use strict"

module.exports = (grunt) ->

  grunt.registerMultiTask "styledocco", "Generate a style guide from your stylesheets.", ->
    done = @async()

    options = @options(
      name: "Styledocco"
      include: null
      preprocessor: null
    )

    @files.forEach (file) ->
      args = []
      command =
        cmd: "styledocco"
        args: args

      args.push file.src[0]
      args.push "--out", file.dest
      args.push "--name", options.name if options.name?
      args.push "--preprocessor", options.preprocessor  if options.preprocessor?

      if options.include?
        options.include.forEach (value) ->
          args.push "--include", value

      putInfo = (error, result, code) ->
        if error isnt null
          grunt.log.error error
          grunt.log.error "Code: " + code
        else
          grunt.log.write result
        done()

      grunt.util.spawn command, putInfo
      grunt.verbose.ok "`styledocco " + command.args.join(" ") + "` was initiated."

