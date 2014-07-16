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

    @contactFormView = new App.Views.FormPanelView

    @idSortedContactView = new App.Views.ListGroupPanelView
      model: @idSortedContactsInfo
      collection: @idSortedContacts
      formView: @contactFormView

    @nameSortedContactView = new App.Views.ListGroupPanelView
      model: @nameSortedContactsInfo
      collection: @nameSortedContacts
      formView: @contactFormView

    @options.region.show(@threeColumnLayout)

    @threeColumnLayout.leftRegion.show(@contactFormView)
    @threeColumnLayout.midRegion.show(@idSortedContactView)
    @threeColumnLayout.rightRegion.show(@nameSortedContactView)

App.module('PersistenceDemoModule', PersistenceDemoModule)
