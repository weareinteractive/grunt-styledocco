/*
 * grunt-kss
 * https://github.com/t32k/grunt-kss
 *
 * Copyright (c) 2013 Koji Ishimoto
 * Licensed under the MIT license.
 */

'use strict';

module.exports = function(grunt) {

  grunt.registerMultiTask('styledocco', 'Your task description goes here.', function() {

    var done = this.async();

    var args = [];
    var command = { cmd: 'styledocco', args: args };

    var opts = this.options({
      name: 'Styledocco',
      include: null,
      preprocessor: null
    });

    this.files.forEach(function(file) {
      args = [];
      command = { cmd: 'styledocco', args: args };

      args.push(file.src[0]);
      args.push('--out', file.dest);

      if (opts.name !== null) {
        args.push('--name', opts.name);
      }

      if (opts.include !== null) {
        args.push('--include', opts.include);
      }

      if (opts.preprocessor !== null) {
        args.push('--preprocessor', opts.preprocessor);
      }

      var putInfo = function (error, result, code) {
        if (error !== null) {
          grunt.log.error(error);
          grunt.log.error('Code: ' + code);
        } else {
          grunt.log.write(result);
        }
        done();
      };

      grunt.util.spawn(command, putInfo);
      grunt.verbose.ok('`styledocco ' + command.args.join(' ') + '` was initiated.');
    });


  });
};