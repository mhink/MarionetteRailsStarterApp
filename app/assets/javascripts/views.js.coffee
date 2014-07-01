class App.Views.StaticView extends Marionette.ItemView
  className: 'row'
  template: HandlebarsTemplates['static_content']

class App.Views.TwoColumnLayout extends Marionette.LayoutView
  className: 'row'
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
  className: 'panel panel-default'
  template: HandlebarsTemplates['list_group_panel']
