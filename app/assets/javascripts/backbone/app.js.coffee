@App = new Marionette.Application

App.module 'Models'
App.module 'Views'
App.module 'Controllers'
App.module 'Routers'

App.addInitializer ->
  App.addRegions
    staticHandlebarsRegion: "#content"
  indexController = new App.Controllers.Index
  new App.Routers.Index(controller: indexController)
  Backbone.history.start()
