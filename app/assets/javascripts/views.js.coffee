class App.Views.StaticView extends Marionette.ItemView
  className: 'row'
  template: HandlebarsTemplates['static_content']

class App.Views.TwoColumnLayout extends Marionette.LayoutView
  className: 'row two-column-layout'
  template: HandlebarsTemplates['two_column_layout']
  regions:
    leftRegion:   '.left-col'
    rightRegion:  '.right-col'

class App.Views.ListGroupItemView extends Marionette.ItemView
  tagName: 'tr'
  template: HandlebarsTemplates['list_group_item']

class App.Views.ListGroupPanelView extends Marionette.CompositeView
  childView: App.Views.ListGroupItemView
  childViewContainer: 'tbody'
  className: 'list-group-panel'
  template: HandlebarsTemplates['list_group_panel']

class App.Views.DynamicListGroupItemView extends App.Views.ListGroupItemView
  template: HandlebarsTemplates['dynamic_list_group_item']

  triggers:
    'click .btn-delete' : 'deleteRecord'

  initialize: (options) ->
    @listenTo(this, 'deleteRecord', @onDeleteRecordClicked)

  onDeleteRecordClicked: ->
    @model.destroy()

class App.Views.DynamicListGroupPanelView extends App.Views.ListGroupPanelView
  childView: App.Views.DynamicListGroupItemView
  childViewContainer: '.contacts-table tbody'
  template: HandlebarsTemplates['dynamic_list_group_panel']

  ui:
    newContactNameInput:  'input.name'
    createRecord:         '.btn-create'
    refreshCollection:    '.btn-refresh'

  triggers:
    'click @ui.createRecord' : 'createRecord'
    'click @ui.refreshCollection' : 'refreshCollection'

  initialize: (options) ->
    @listenTo(this, 'createRecord', @onCreateRecordClicked)
    @listenTo(this, 'refreshCollection', @onRefreshCollectionClicked)

  onCreateRecordClicked: ->
    @collection.create({
      name: @ui.newContactNameInput.val()
    },
    {
      wait: true
    })
    @ui.newContactNameInput.val('')
    

  onRefreshCollectionClicked: ->
    console.log('Heard click .btn-refresh')
    @collection.fetch()
