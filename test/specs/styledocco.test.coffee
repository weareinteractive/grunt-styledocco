"use strict"

chai = require('chai')
grunt = require('grunt')

assert = chai.assert
chai.Assertion.includeStack = true

# See http://visionmedia.github.io/mocha/ for Mocha tests.
# See http://chaijs.com/api/assert/ for Chai assertion types.

module.exports =
  "Test #styledocco":
    "was successful": () ->
      assert.isTrue grunt.file.exists('test/tmp/index.html')
      assert.isTrue grunt.file.exists('test/tmp/structured.html')
