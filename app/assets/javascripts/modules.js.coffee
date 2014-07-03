class PersistenceDemoModule extends Marionette.Module
  startWithParent: false

  initializeModelsAndCollections: ->

    @idSortedContactsInfo = new Backbone.Model
      title: "Contacts: sorted by id"

    @nameSortedContactsInfo = new Backbone.Model
      title: "Contacts: sorted by name"

    @idSortedContacts = new App.Models.Contacts
      comparator: 'id'

    @nameSortedContacts = new App.Models.Contacts
      comparator: 'name'

    @idSortedContacts.fetch()
    @nameSortedContacts.fetch()

  initialize: (name, app, options) ->
    @app = app

  onStart: (@options) ->
    @initializeModelsAndCollections()

    @threeColumnLayout = new App.Views.ThreeColumnLayout

    @idSortedContactView = new App.Views.ListGroupPanelView
      model: @idSortedContactsInfo
      collection: @idSortedContacts

    @nameSortedContactView = new App.Views.ListGroupPanelView
      model: @nameSortedContactsInfo
      collection: @nameSortedContacts

    @contactFormView = new App.Views.FormPanelView

    @options.region.show(@threeColumnLayout)

    @threeColumnLayout.leftRegion.show(@contactFormView)
    @threeColumnLayout.midRegion.show(@idSortedContactView)
    @threeColumnLayout.rightRegion.show(@nameSortedContactView)

  notifyWebsocket: (view, model, collection) ->
    console.log('Sending a SYN to Rails...')
    @app.websocket.trigger('contacts.syn', {message: 'Hello from the client!'})

App.module('PersistenceDemoModule', PersistenceDemoModule)
