class App.Views.ThreeColumnLayout extends Marionette.LayoutView
  className: 'row three-column-layout'
  template: HandlebarsTemplates['three_column_layout']
  regions:
    leftRegion:   '.left-col'
    midRegion:    '.mid-col'
    rightRegion:  '.right-col'

class App.Views.ListGroupItemView extends Marionette.ItemView
  tagName: 'tr'
  template: HandlebarsTemplates['list_group_item']

class App.Views.ListGroupPanelView extends Marionette.CompositeView
  childView: App.Views.ListGroupItemView
  childViewContainer: 'tbody'
  className: 'list-group-panel'
  template: HandlebarsTemplates['list_group_panel']

  triggers:
    'click .btn-refresh' : 'refreshCollection'

  initialize: (options) ->
    @listenTo(this, 'refreshCollection', @refreshCollection)

  refreshCollection: ->
    @collection.fetch()

class App.Views.FormPanelView extends Marionette.ItemView
  className: 'form-panel'
  template: HandlebarsTemplates['form_panel']
