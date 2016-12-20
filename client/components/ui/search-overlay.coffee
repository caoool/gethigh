# client/components/ui/search-overlay.coffee


Template.search_overlay.events

  'submit .search-overlay': (e) ->

    e.preventDefault()

    Session.set 'search_value', e.target.text.value
    $('.search-overlay-menu').removeClass 'open'


  'keyup #search': (e) ->

    e.preventDefault()

    Session.set 'search_value', e.target.value


  'click .search-overlay-close': (e) ->

    e.preventDefault()

    $('.search-overlay-menu').toggleClass 'open'
