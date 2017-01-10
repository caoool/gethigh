# client/components/sidenav.coffee

delay = (ms, func) -> setTimeout func, ms

Template.sidenav.onCreated ->
  # We subscribe to our 'userData' publication, so we will
  # have access to the some additional fields of user collection
  # Publication is defined in users/server/publications.coffee
  @subscribe 'userData'


Template.sidenav.events
  'click #close_sidenav': (e) ->
    e.preventDefault()
    $('.sidenav').css 'width', '0px'
    $('.box').css 'marginRight', '0px'
    window.navIsToggled = false
    delay 500, -> window.iso.arrange()
  'click #login_with_google': (e) ->
    e.preventDefault()
    Meteor.loginWithGoogle (error, result) ->
      if error
        console.log error
      else
        console.log result

  'click #login_with_facebook': (e) ->
    e.preventDefault()
    Meteor.loginWithFacebook (error, result) ->
      if error
        console.log error
      else
        console.log result

  'click #link_with_google': (e) ->
    e.preventDefault()
    Meteor.linkWithGoogle (error, result) ->
      if error
        console.log error
      else
        console.log result

  'click #link_with_facebook': (e) ->
    e.preventDefault()
    Meteor.linkWithFacebook (error, result) ->
      if error
        console.log error
      else
        console.log result

  'click #logout': (e) ->
    e.preventDefault()
    Meteor.logout (error) ->
      if error then console.log error
