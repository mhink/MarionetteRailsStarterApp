class App.Models.Contact extends Backbone.Model
  urlRoot: '/api/contacts'

class App.Models.Contacts extends Backbone.Collection
  url: '/api/contacts'
  model: App.Models.Contact

class App.Models.LocalContact extends App.Models.Contact
class App.Models.LocalContacts extends App.Models.Contacts

App.Models.configureStorage(App.Models.LocalContact)
App.Models.configureStorage(App.Models.LocalContacts)
