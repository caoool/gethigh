# test-page.coffee
# It is a test-page for you to test functions manually
# Just write some code here and in its view (test-page.jade)
# Once working properly, code can be re write in actual work


Template.test_page.onCreated ->

  # We subscribe to our 'userData' publication, so we will
  # have access to the some additional fields of user collection
  # Publication is defined in users/server/publications.coffee
  @subscribe 'userData'


Template.test_page.events

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
