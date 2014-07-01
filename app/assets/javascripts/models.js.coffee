class App.Models.Contact extends Backbone.Model
  urlRoot: '/api/contacts'

class App.Models.Contacts extends Backbone.Collection
  url: '/api/contacts'
  model: App.Models.Contact
