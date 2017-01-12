# client/components/ui/header.coffee


window.navIsToggled = false
delay = (ms, func) -> setTimeout func, ms

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
  # $(window).scroll ->
  #   stickyHeader()
  #
  # $(window).resize ->
  #   stickyHeader()


Template.header.events
  'click #toggle_nav': (e) ->
    e.preventDefault()
    if window.navIsToggled
      $('.sidenav').css 'width', '0px'
      $('.box').css 'marginRight', '0px'
      $('.left_side_menu').css 'width', '146px'
      # uncomment to enable push content
      # $('#main').css 'marginLeft', '250px'
      window.navIsToggled = false
    else
      $('.sidenav').css 'width', '320px'
      $('.box').css 'marginRight', '360px'
      $('.left_side_menu').css 'width', '0px'
      # uncomment to enable push content
      # $('#main').css 'marginLeft', '0'
      window.navIsToggled = true
    delay 500, -> window.iso.arrange()


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
