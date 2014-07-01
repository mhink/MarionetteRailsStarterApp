class PersistenceDemoModule extends Marionette.Module
  startWithParent: false

  initializeModelsAndCollections: ->

    @leftInfo = new Backbone.Model
      title: "DEMO: Client-side persistence"
      bodyText: "Items in this list are created in memory on the client side."

    @rightInfo = new Backbone.Model
      title: "DEMO: Server-side persistence"
      bodyText: "Items in this list live on the server side!"

    @leftContacts = new Backbone.Collection([
        { id: 1, name: 'Alice Foo' }
        { id: 2, name: 'Bob Bar' }
        { id: 3, name: 'Carol Baz' }
      ])

    @rightContacts = new App.Models.Contacts
    @rightContacts.fetch()

  onStart: (@options) ->
    @initializeModelsAndCollections()

    @twoColumnLayout = new App.Views.TwoColumnLayout

    @leftPanelView = new App.Views.ListGroupPanelView
      model: @leftInfo
      collection: @leftContacts

    @rightPanelView = new App.Views.DynamicListGroupPanelView
      model: @rightInfo
      collection: @rightContacts

    @options.region.show(@twoColumnLayout)

    @twoColumnLayout.leftRegion.show(@leftPanelView)
    @twoColumnLayout.rightRegion.show(@rightPanelView)

App.module('PersistenceDemoModule', PersistenceDemoModule)
