/*
grunt-styledocco
https://github.com/weareinteractive/grunt-styledocco

Copyright (c) 2013 We Just Do Stuff, Kim & Pollak GbR under the MIT license.
*/

"use strict";
module.exports = function(grunt) {
  return grunt.registerMultiTask("styledocco", "Generate a style guide from your stylesheets.", function() {
    var done, options;
    done = this.async();
    options = this.options({
      name: "Styledocco",
      include: null,
      preprocessor: null
    });
    return this.files.forEach(function(file) {
      var args, command, putInfo;
      args = [];
      command = {
        cmd: "styledocco",
        args: args
      };
      args.push(file.src[0]);
      args.push("--out", file.dest);
      if (options.name != null) {
        args.push("--name", options.name);
      }
      if (options.preprocessor != null) {
        args.push("--preprocessor", options.preprocessor);
      }
      if (options.include != null) {
        options.include.forEach(function(value) {
          return args.push("--include", value);
        });
      }
      putInfo = function(error, result, code) {
        if (error !== null) {
          grunt.log.error(error);
          grunt.log.error("Code: " + code);
        } else {
          grunt.log.write(result);
        }
        return done();
      };
      grunt.util.spawn(command, putInfo);
      return grunt.verbose.ok("`styledocco " + command.args.join(" ") + "` was initiated.");
    });
  });
};
