@MyApp = do (Backbone, Marionette, HandlebarsTemplates) ->

  if Backbone.history
    Backbone.history.start()

  class StaticHandlebarsView extends Marionette.ItemView
    template: HandlebarsTemplates['test']

  class MyApp extends Marionette.Application
    regions:
      content: "#content"

    onStart: (options) ->
      @addRegions(@regions)

      console.log('MyApp has started!')

      @content.show(new StaticHandlebarsView)

    navigate: (route, options) ->
      Backbone.history.navigate route, options

  new MyApp

