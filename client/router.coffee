# router.coffee
# Client side (frontend) routing happens here using iron router (atmosphere package)
# This is the only file for routing


Router.configure
  layoutTemplate: 'application_layout'


Router.route '/',
  template: 'main'


Router.route '/test-page',
  template: 'test_page'
