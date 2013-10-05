# grunt-styledocco

[![Build Status](https://travis-ci.org/weareinteractive/grunt-styledocco.png?branch=master)](https://travis-ci.org/weareinteractive/grunt-styledocco) [![devDependency Status](https://david-dm.org/weareinteractive/grunt-styledocco/dev-status.png)](https://david-dm.org/weareinteractive/grunt-styledocco#info=devDependencies)

> StyleDocco generates documentation and style guide documents from your stylesheets.

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

*Run this task with the `grunt sass` command.*

> StyleDocco generates documentation and style guide documents from your stylesheets.
>
> Stylesheet comments will be parsed through Markdown and displayed in a generated HTML document. You can write HTML code prefixed with 4 spaces or between code fences (```) in your comments, and StyleDocco show a preview with the styles applied, and displays the example HTML code.
>
> The previews are rendered in a resizable iframes to make it easy to demonstrate responsive designs at different viewport sizes.

This task requires you to have [StyleDocco](https://github.com/jacobrask/styledocco) installed globally. Run `npm install -g styledocco` to install it.


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


### Examples

#### Example config

```javascript
grunt.initConfig({
  styledocco: {
    dist: {
      options: {
        name: 'My Project'
      },
      files: {
        'docs': 'main.css'
      }
    }
  }
});

grunt.loadNpmTasks('grunt-styledocco');

grunt.registerTask('default', ['styledocco']);
```

#### Compile multiple files

```javascript
grunt.initConfig({
  styledocco: {
    dist: {
      options: {
        name: 'My Project'
      },
      files: {
        'docs': ['main.css', 'widgets.css']
      }
    }
  }
});
```

## Documentation
Check out the [StyleDocco Website](https://github.com/jacobrask/styledocco) for further reading.

## Contributing
In lieu of a formal styleguide, take care to maintain the existing coding style. Add unit tests for any new or changed functionality. Lint and test your code using [Grunt](http://gruntjs.com/).

## License
Copyright (c) We Are Interactive under the [MIT licenses](https://github.com/weareinteractive/grunt-styledocco/blob/master/LICENSE)
