###
grunt-styledocco
https://github.com/weareinteractive/grunt-styledocco

Copyright (c) 2013 We Are Interactive
Licensed under the MIT license.
###
module.exports = (grunt) ->
  "use strict"

  # Please see the grunt documentation for more information regarding task and
  # helper creation: https://github.com/cowboy/grunt/blob/master/docs/toc.md

  # -----------------------------------------------------------------------------------------------
  # ~ Tasks
  # -----------------------------------------------------------------------------------------------

  grunt.registerMultiTask "styledocco", "Generate a style guide from your stylesheets.", ->
    done = @async()

    options = @options(
      name: "Styledocco"
      cmd: "styledocco"
      include: null
      preprocessor: null
    )

    @files.forEach (file) ->
      args = []
      command =
        cmd: options.cmd
        args: args

      args.push file.src[0]
      args.push "--out", file.dest
      args.push "--no-minify" if options["no-minify"]?
      args.push "--name", options.name if options.name?
      args.push "--preprocessor", options.preprocessor  if options.preprocessor?
      args.push "--verbose" if options.verbose?

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

