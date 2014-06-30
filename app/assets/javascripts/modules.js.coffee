class WebStorageModule extends Marionette.Module
  startWithParent: false

  initializeModelsAndCollections: ->
    @leftModel = new Backbone.Model
      title: 'Left dynamic panel'
      bodyText: "This text is defined as an attribute on a Backbone.Model."

    @rightModel = new Backbone.Model
      title: 'Right dynamic panel'
      bodyText: "As is this text!"

    @leftCollection = new Backbone.Collection([
      { text: 'Foo' }
      { text: 'Bar' }
      { text: 'Baz' }
    ])

    @rightCollection = new Backbone.Collection([
      { text: 'Alice' }
      { text: 'Bob' }
      { text: 'Charlie' }
    ])

  onStart: (@options) ->
    @initializeModelsAndCollections()

    @twoColumnLayout = new App.Views.TwoColumnLayout

    @leftPanelView = new App.Views.ListGroupPanelView
      model: @leftModel
      collection: @leftCollection

    @rightPanelView = new App.Views.ListGroupPanelView
      model: @rightModel
      collection: @rightCollection

    @options.region.show(@twoColumnLayout)

    @twoColumnLayout.leftRegion.show(@leftPanelView)
    @twoColumnLayout.rightRegion.show(@rightPanelView)

    console.log("Web storage module started.")

App.module('WebStorageModule', WebStorageModule)
