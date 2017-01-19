Template.unfinished_item.events
  'change .item_checkbox': (e) ->
    e.preventDefault()
    $(e.currentTarget.parentNode.lastChild).toggleClass 'hide_description'
