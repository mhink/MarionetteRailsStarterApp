class App.Controllers.Index
  index: ->
    @staticView = new App.Views.StaticView

    App.staticContent.show(@staticView)

    App.WebStorageModule.start(region: App.dynamicContent)

class App.Routers.Index extends Backbone.Marionette.AppRouter
  appRoutes:
    '': 'index'
