# client/pages/main.coffee


################################
# Local Properties and Methods #
################################


# DESC
#   Function will be called when user scroll page
#   Used to detect and load more data for infinite scrolling
#
loadmore = ->

  target = $ '#loading'
  threshold = $(window).scrollTop() + $(window).height() - target.height()

  if target.offset().top < threshold
    if !target.data 'visible'
      target.data 'visible', true
      newLimit = LOAD_INCREMENT + Session.get SESSION_NAMES.LISTS_LOAD_LIMIT
      Session.set SESSION_NAMES.LISTS_LOAD_LIMIT, newLimit
  else
    if target.data 'visible'
      target.data 'visible', false


########################
# Template Controllers #
########################


Template.main.onCreated ->

  Session.setDefault SESSION_NAMES.LISTS_LOAD_LIMIT, LOAD_INCREMENT

  @autorun ->
    Meteor.subscribe 'lists.all', Session.get SESSION_NAMES.LISTS_LOAD_LIMIT


Template.main.onRendered ->

  # When user scroll check if load more is visible (detect bottom)
  # If so, load more data, this will give the effect of infinite scrolling
  $(window).scroll loadmore


Template.main.events

  'click .main #new_list': (e) ->
    e.preventDefault()

    Meteor.call 'lists.insert', {}


Template.main.helpers

  lists: ->
    Lists.find()

  loadmore: ->
    !(Lists.find().count() < Session.get SESSION_NAMES.LISTS_LOAD_LIMIT)
