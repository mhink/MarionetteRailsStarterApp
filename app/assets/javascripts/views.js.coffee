class App.Views.StaticView extends Marionette.ItemView
  className: 'row'
  template: HandlebarsTemplates['static_content']

class App.Views.TwoColumnLayout extends Marionette.Layout
  className: 'row'
  template: HandlebarsTemplates['two_column_layout']
  regions:
    leftRegion:   '.left-col'
    rightRegion:  '.right-col'

class App.Views.ListGroupItemView extends Marionette.ItemView
  tagName: 'tr'
  className: 'list-group-item'
  template: HandlebarsTemplates['list_group_item']

class App.Views.ListGroupPanelView extends Marionette.CompositeView
  itemView: App.Views.ListGroupItemView
  itemViewContainer: 'tbody'

  className: 'panel panel-default'
  template: HandlebarsTemplates['list_group_panel']
