class App.Controllers.Index
  index: ->
    staticHandlebarsView = new App.Views.StaticHandlebarsView
    App.staticHandlebarsRegion.show(staticHandlebarsView)

class App.Routers.Index extends Backbone.Marionette.AppRouter
  appRoutes:
    '': 'index'
