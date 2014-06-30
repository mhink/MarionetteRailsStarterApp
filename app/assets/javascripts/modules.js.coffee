class PersistenceDemoModule extends Marionette.Module
  startWithParent: false

  initializeLocalContacts: ->
    contacts = new App.Models.LocalContacts()
    contacts.fetch()

    if contacts.length() == 0
      contacts = new App.Models.LocalContacts([
        { id: 1, name: 'Alice Foo' }
        { id: 2, name: 'Bob Bar' }
        { id: 3, name: 'Carol Baz' }
      ])
      _(contacts).each (contact) ->
        contact.save()

    contacts

  initializeServerContacts: ->
    contacts = new App.Models.LocalContacts()
    contacts.fetch()
    contacts

  initializeModelsAndCollections: ->
    @leftInfo = new Backbone.Model
      title: "DEMO: Client-side persistence"
      bodyText: "Items in this list live in web storage on the user's browser."

    @rightInfo = new Backbone.Model
      title: "DEMO: Server-side persistence"
      bodyText: "Items in this list live in a database on the server-side!"

    @leftContacts   = initializeLocalContacts()
    @rightContacts  = initializeServerContacts()

  onStart: (@options) ->
    @initializeModelsAndCollections()

    @twoColumnLayout = new App.Views.TwoColumnLayout

    @leftPanelView = new App.Views.ListGroupPanelView
      model: @leftInfo
      collection: @leftContacts

    @rightPanelView = new App.Views.ListGroupPanelView
      model: @rightInfo
      collection: @rightContacts

    @options.region.show(@twoColumnLayout)

    @twoColumnLayout.leftRegion.show(@leftPanelView)
    @twoColumnLayout.rightRegion.show(@rightPanelView)

    console.log("Web storage module started.")

App.module('PersistenceDemoModule', PersistenceDemoModule)
