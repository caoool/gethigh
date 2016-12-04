# client/components/ui/header.coffee


navIsToggled = false


stickyHeader = ->

  scrolled = $(window).scrollTop()
  windHeight = $(window).height()

  if scrolled > 150
    $('.header').addClass 'header-prepare'
  else
    $('.header').removeClass 'header-prepare'
  if scrolled > 1
    $('.header').addClass 'header-fixed'
  else
    $('.header').removeClass 'header-fixed'


Template.header.onRendered ->

  $(window).scroll ->
    stickyHeader()

  $(window).resize ->
    stickyHeader()


Template.header.events

  'click #toggle_nav': (e) ->
    e.preventDefault()

    unless navIsToggled
      $('.sidenav').css 'width', '380px'
      # uncomment to enable push content
      # $('#main').css 'marginLeft', '250px'
      navIsToggled = true
    else
      $('.sidenav').css 'width', '0'
      # uncomment to enable push content
      # $('#main').css 'marginLeft', '0'
      navIsToggled = false

  'click .search-overlay-menu-btn': (e) ->
    e.preventDefault()

    $('.search-overlay-menu').addClass 'open'
    $('.search-overlay-menu input').focus()


  'click .search-overlay-close': (e) ->
    e.preventDefault()

    $('.search-overlay-menu').removeClass 'open'


  'click #new_list': (e) ->
    e.preventDefault()

    Meteor.call 'lists.insert', {}

  'click #filter_all': (e) ->
    e.preventDefault()
    Session.set('filter', 'filter_all')

  'click #filter_owner': (e) ->
    e.preventDefault()
    Session.set('filter', 'filter_owner')
