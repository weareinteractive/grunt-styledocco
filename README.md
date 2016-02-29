# grunt-styledocco

[![Build Status](https://travis-ci.org/weareinteractive/grunt-styledocco.png?branch=master)](https://travis-ci.org/weareinteractive/grunt-styledocco)
[![Dependency Status](https://gemnasium.com/weareinteractive/grunt-styledocco.png)](https://gemnasium.com/weareinteractive/grunt-styledocco)
[![NPM version](https://badge.fury.io/js/grunt-styledocco.png)](http://badge.fury.io/js/grunt-styledocco)

> StyleDocco generates documentation and style guide documents from your stylesheets.

**DEPRICATION NOTICE: this project hasn't been maintained and updated for a while now. Please use as is and send PRs if you need changes.**

## Getting Started

This plugin requires Grunt `~0.4.1`

If you haven't used [Grunt](http://gruntjs.com/) before, be sure to check out the [Getting Started](http://gruntjs.com/getting-started) guide, as it explains how to create a [Gruntfile](http://gruntjs.com/sample-gruntfile) as well as install and use Grunt plugins. Once you're familiar with that process, you may install this plugin with this command:

```shell
npm install grunt-styledocco --save-dev
```

Once the plugin has been installed, it may be enabled inside your Gruntfile with this line of JavaScript:

```js
grunt.loadNpmTasks('grunt-styledocco');
```

## The "styledocco" task

*Run this task with the `grunt styledocco` command.*

> StyleDocco generates documentation and style guide documents from your stylesheets.
>
> Stylesheet comments will be parsed through Markdown and displayed in a generated HTML document. You can write HTML code prefixed with 4 spaces or between code fences (```) in your comments, and StyleDocco show a preview with the styles applied, and displays the example HTML code.
>
> The previews are rendered in a resizable iframes to make it easy to demonstrate responsive designs at different viewport sizes.

If you don't have a global install of [StyleDocco](https://github.com/jacobrask/styledocco) which can be achieved by `npm install -g styledocco` , you need to specify options.cmd to the binary you want to use.

### Options

#### options.name

Type: `String`
Default value: `Styledocco`

The name of the project.

#### options.include

Type: `String`
Default value: `null`

Include specified CSS and/or JavaScript files in the previews. (ex: `["mysite.css", "app.js"]`)

#### options.preprocessor

Type: `String`
Default value: `null`

A custom preprocessor command (ex: `"~/bin/lessc"`).

#### options.cmd

Type: `String`
Default value: `styledocco`

A custom Styledocco command (ex: `"./node_modules/.bin/styledocco"`).

#### options.verbose

Type: `Boolean`
Default value: `false`

Show log messages when generating the documentation.

#### options.no-minify

Type: `Boolean`
Default value: `false`

Do not minify the code.

### Examples

*Note: Styledocco only takes in one `path/to/docs` and one `path/to/styles` argument so you can only use single static file mapping!*

#### Example config

```
grunt.initConfig({
  styledocco: {
    dist: {
      options: {
        name: 'My Project'
      },
      files: {
        'path/to/docs': 'path/to/styles'
      }
    }
  }
});

grunt.loadNpmTasks('grunt-styledocco');

grunt.registerTask('default', ['styledocco']);
```

#### Compile multiple files

```
grunt.initConfig({
  styledocco: {
    dist: {
      options: {
        name: 'My Project'
      },
      files: {
        'path/to/docs1': 'path/to/styles1',
        'path/to/docs2': 'path/to/styles2'
      }
    }
  }
});
```

## Documentation
Check out the [StyleDocco Website](https://github.com/jacobrask/styledocco) for further reading.

## Contributing

In lieu of a formal styleguide, take care to maintain the existing coding style. Add unit tests for any new or changed functionality. Lint and test your code using [Grunt](http://gruntjs.com/).

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License
Copyright (c) We Are Interactive under the MIT license.
