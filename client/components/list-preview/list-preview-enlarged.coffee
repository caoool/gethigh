Template.list_preview_enlarged.events
  'click #close_enlarged_preview': (e) ->
    e.preventDefault()
    previewNode = e.currentTarget.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode
    $(previewNode).toggleClass 'large'
    $(previewNode.lastChild).css 'display', 'none'
    $(previewNode.firstChild).css 'display', 'block'
    window.iso.arrange()

Template.list_preview_enlarged.helpers
  listItems: ->
    [1, 2, 3, 4, 5]
