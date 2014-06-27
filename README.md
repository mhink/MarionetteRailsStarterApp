# Marionette/Rails Starter App
Matt Hink
June 27, 2014

## Introduction

This sample application demonstrates how to structure and build a full-stack, rich-client web application using the following core technologies:

### Server-side
* Rails 4           (Web framework)
* HAML              (Templating language)
* Coffeescript      (Client-side scripting language)

### Client-side
* Twitter Bootstrap (CSS framework)
* Backbone.js       (Client-side MVC framework)
* Marionette.js     (Backbone.js extensions)
* Handlebars.js     (Javascript templating engine)

Front-end package and dependency management is handled by [Bower](http://bower.io).

## Technical Overview
This section describes some of the design decisions to keep in mind while structuring an application of this type.

### Front-end Dependency Management
Traditionally, there are a couple different ways to track third-party asset versioning in Rails applications.

1. Manually copy the frameworks you want into /vendor/assets.  This gives you the most control over what assets are getting served to your clients, but it has its drawbacks- either your application repo gets bloated with third-party code (yuck) or, when it comes time for deployment, you have to make sure your assets are getting copied to your production infrastructure manually. (Double yuck.)  This can also get you into trouble if you're using client-side frameworks with complicated dependencies- if you try and upgrade jQuery, you'd better hope you're not breaking other frameworks.

2. Install a gem which drops the appropriate files into /vendor/assets at runtime.  This has been the standard way to do client-side version and dependency management in Rails for quite some time.  However, there is a drawback. Client-side frameworks are often not packaged as gems by the core development team.  This isn't usually a problem, as gem maintainers generally do a good job of updating their gems to keep up with the core version.  However, the tricky parts come into play if the gem's *version* and its *dependencies' versions* aren't kept well in sync with the original package.  It's rather frustrating to have to deal with gem dependency hell when the underlying *client-side* packages work together fine.

In light of these two points, I decided to do things right and get Bower integrated with Rails.  The basic idea is that Bower packages, similarly to Ruby gems, are *the* way to package front-end assets.  No more writing integration gems, yay!  This app uses the "bower-rails" gem and includes a Bowerfile, which lists front-end asset dependencies for the application.

### Client-side templating
Many Backbone and Marionette tutorials will demonstrate the use of client-side templates by adding inline templates to an HTML page, and having Backbone.js pick those up to use.  While this is fine for tutorials and demo apps, large production systems often use lots of different templates, and inlining every one of them means that at runtime, you'll be sending much more data over the wire than you really need to.  Using a client-side templating engine will allow your Backbone application to only load the templates it needs, when it needs them.

In this project, I've chosen Handlebars.js as my client-side templating engine.  Furthermore, I use the 'hamlbars' templating language, which is basically "you got your HAML in my handlebars!"  There are many different approaches you can take with regards to templating, and I encourage you to try your own.  This is just one way to do it.

(more to come soon...)
