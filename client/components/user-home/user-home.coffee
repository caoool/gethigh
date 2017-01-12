delay = (ms, func) -> setTimeout func, ms
Template.user_home.helpers
  lists: ->
    [1, 2, 3, 4, 5, 6]

Template.user_home.onRendered ->
  delay 500,
    ->
      window.iso = new Isotope '.lists',
        itemSelector: '.preview',
        layoutMode: 'masonry'
