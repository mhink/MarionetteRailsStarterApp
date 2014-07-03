class MarionetteRailsDemoApp extends Marionette.Application
  onStart: ->
    @csrfToken = $(document).find('meta[name="csrf-token"]').attr 'content'

    $.ajaxSetup
      headers:
        'X-CSRF-Token': @csrfToken

    @addRegions
      dynamicContent: "#client-side-dynamic-content"

    @websocket = new WebSocketRails('localhost:3000/websocket')

    @websocket.bind 'ack', (data) ->
      console.log('Heard contact.ack over websocket!')
      console.log(data)

    new App.Routers.Index(controller: new App.Controllers.Index)
    Backbone.history.start()

@App = new MarionetteRailsDemoApp

# Module declarations
App.module 'Models'
App.module 'Views'
App.module 'Controllers'
App.module 'Routers'
App.module 'Modules'
