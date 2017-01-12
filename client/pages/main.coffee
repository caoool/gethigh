# client/pages/main.coffee


################################
# Local Properties and Methods #
################################

# DESC
#   Function will be called when user scroll page
#   Used to detect and load more data for infinite scrolling
#
loadmore = ->
  isAtBottom = ($(window).scrollTop() + $(window).height() == $(document).height())
  if isAtBottom
    newLimit = LOAD_INCREMENT + Session.get SESSION_NAMES.LISTS_LOAD_LIMIT
    Session.set SESSION_NAMES.LISTS_LOAD_LIMIT, newLimit
delay = (ms, func) -> setTimeout func, ms
########################
# Template Controllers #
########################

Template.main.onCreated ->
  Session.setDefault SESSION_NAMES.LISTS_LOAD_LIMIT, LOAD_INCREMENT
  @autorun ->
    Meteor.subscribe 'lists.all', Session.get SESSION_NAMES.LISTS_LOAD_LIMIT
    if window.iso
      window.iso.arrange()


Template.main.onRendered ->
  # When user scroll check if load more is visible (detect bottom)
  # If so, load more data, this will give the effect of infinite scrolling
  $(window).scroll loadmore
  delay 500,
    ->
      if !window.iso
        window.iso = new Isotope '.lists',
          itemSelector: '.preview',
          layoutMode: 'masonry'


Template.main.events
  'click .main .lists .toggle': (e) ->
    e.preventDefault()
    Session.set SESSION_NAMES.SELECTED_LIST_ID, @_id


Template.main.helpers
  lists: ->
    if Session.get('filter') == 'filter_owner' && Session.get('search_value')
      Lists.find { name: {$regex: Session.get('search_value'), $options: 'i'}, created_by: Meteor.userId()}
    else if Session.get('filter') == 'filter_owner'
      Lists.find { created_by: Meteor.userId() }
    else if Session.get('search_value')
      Lists.find { name: {$regex: Session.get('search_value'), $options: 'i'}}
    else
      Lists.find()

  loadmore: ->
    !(Lists.find().count() < Session.get SESSION_NAMES.LISTS_LOAD_LIMIT)

  selected_list: ->
    Lists.findOne Session.get SESSION_NAMES.SELECTED_LIST_ID
