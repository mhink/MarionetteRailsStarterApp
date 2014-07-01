@App = new Marionette.Application

# Module declarations
App.module 'Models'
App.module 'Views'
App.module 'Controllers'
App.module 'Routers'
App.module 'Modules'

App.addInitializer ->
  App.addRegions
    staticContent: "#client-side-static-content"
    dynamicContent: "#client-side-dynamic-content"

  indexController = new App.Controllers.Index
  new App.Routers.Index(controller: indexController)
  Backbone.history.start()
