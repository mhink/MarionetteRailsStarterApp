class App.Controllers.Index
  index: ->
    App.PersistenceDemoModule.start(region: App.dynamicContent)

class App.Routers.Index extends Backbone.Marionette.AppRouter
  appRoutes:
    '': 'index'
