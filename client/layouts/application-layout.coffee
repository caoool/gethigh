# clients/layouts/application_layout.coffee
# Controller of main layout view (application_layout.jade)
# For template 'application_layout'


# Local variables
# Scopr -> this file
navIsToggled = false


Template.application_layout.events

  'click #toggle_nav': (e) ->
    e.preventDefault()

    unless navIsToggled
      $('.sidenav').css 'width', '250px'
      $('#main').css 'marginLeft', '250px'
      navIsToggled = true
    else
      $('.sidenav').css 'width', '0'
      $('#main').css 'marginLeft', '0'
      navIsToggled = false
