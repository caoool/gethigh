# routes.coffee
# Client side (frontend) routing happens here using iron router (atmosphere package)
# This is the only file for routing


Router.configure
  layoutTemplate: 'application_layout'


##########
# Routes #
##########

Router.route '/',
  template: 'main'

Router.route '/test-page',
  template: 'test_page'

Router.route '/list/:_id',
  template: 'list_edit'


#################################
# Testing Routes for components #
#################################

Router.route '/components/item-edit',
  template: 'item_edit'

Router.route '/components/list-edit',
  template: 'list_edit'
