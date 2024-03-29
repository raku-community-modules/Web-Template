[![Actions Status](https://github.com/raku-community-modules/Web-Template/workflows/test/badge.svg)](https://github.com/raku-community-modules/Web-Template/actions)

# Web::Template

## Introduction

A simple abstraction layer, providing a consistent API for different
template engines. This is designed for use in higher level web frameworks
such as [Web::App::Ballet](https://github.com/raku-community-modules/Web-App-Ballet/)
and [Web::App::MVC](https://github.com/raku-community-modules/Web-App-MVC/).

## Supported Template Engines

 * [Template6](https://github.com/raku-community-modules/Template6/)

   An engine inspired by Template Toolkit. Has many features.
   Wrapper is Web::Template::Template6

 * [Template::Mojo](https://github.com/raku-community-modules/Template-Mojo/)

   A template engine inspired by Perl's Mojo::Template.
   Wrapper is Web::Template::Mojo

 * [HTML::Template](https://github.com/masak/html-template/)

   A template engine inspired by Perl's HTML::Template.
   Wrapper is Web::Template::HTML

## Broken Template Engines

 * [Flower::TAL](https://github.com/supernovus/flower/)

   An implementation of the TAL/METAL XML-based template languages from Zope.
   Wrapper is Web::Template::TAL

   I will get this fixed up when I can and re-add it to the list of supported
   template engines.

## Methods

All of the wrapper classes provide common API methods, so as long as your
web framework or application supports the following API, it doesn't have to
worry about the APIs of the individual template engines themselves.

### set-path ($path, ...)

Set the directory or directories to find the template files in.
For engines without native support of multiple search paths, or even
file-based templates to begin with, the wrapper classes add such support.

### render ($template, ...)

Takes the template name to render, and passes any additional parameters
through to the template engine. Most template engines use named parameters,
but some like Mojo, use positional parameters. This handles both.

## Usage

```raku
use Web::Template::Template6;
my $engine = Web::Template::Template6.new;
$engine.set-path('./views');
$engine.render('example.xml', :name<Bob>);
```

See one of the web application frameworks using this for better examples.

## TODO

 * Add a test suite with all supported template engines covered.
 * Add support for the Plosurin template engine.

## AUTHOR

Timothy Totten

Source can be located at: https://github.com/raku-community-modules/Web-Template . Comments and Pull Requests are welcome.

COPYRIGHT AND LICENSE
=====================

Copyright 2013 - 2019 Timothy Totten

Copyright 2020 - 2023 Raku Community

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

