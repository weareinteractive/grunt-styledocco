'use strict'

chai = require('chai')
grunt = require('grunt')

assert = chai.assert
chai.Assertion.includeStack = true

module.exports =
  "Test #styledocco":
    "was successful": () ->
      assert.equal grunt.file.exists('test/tmp/index.html'), true
      assert.equal grunt.file.exists('test/tmp/structured.html'), true
