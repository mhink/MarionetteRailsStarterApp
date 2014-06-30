class WebStorageModule extends Marionette.Module
  startWithParent: false

  initializeModelsAndCollections: ->
    @leftModel = new Backbone.Model
      bodyText: "This text is defined as an attribute on a Backbone.Model."

    @rightModel = new Backbone.Model
      bodyText: "As is this text!"

    @leftCollection = new Backbone.Collection([
      { text: 'This element lives in a Backbone.Collection' }
      { text: 'Like this one...' }
      { text: 'And this one!' }
    ])

    @rightCollection = new Backbone.Collection([
      { text: 'These elements live in a different collection.' }
      { text: 'Which is displayed by a different instance of the same ListGroupPanelView!' }
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
