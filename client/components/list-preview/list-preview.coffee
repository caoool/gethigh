Template.list.onCreated ->
  @subscribe 'items.inList', Template.instance().data['_id']

Template.list_preview.onRendered ->
  if window.iso
    window.iso.insert Template.instance().firstNode.parentNode

Template.list_preview.events
  'click .list_info': (e) ->
    e.preventDefault()
    if $(e.currentTarget.parentNode.firstChild).css('display') == 'block'
      $(e.currentTarget.parentNode.lastChild).css 'height', $(e.currentTarget.parentNode.firstChild).css('height')
      $(e.currentTarget.parentNode.firstChild).css 'display', 'none'
      $(e.currentTarget.parentNode.lastChild).css 'display', 'block'
      $(e.currentTarget).addClass 'list_info_show_items'
    else
      $(e.currentTarget.parentNode.firstChild).css 'display', 'block'
      $(e.currentTarget.parentNode.lastChild).css 'display', 'none'
      $(e.currentTarget).removeClass 'list_info_show_items'

Template.list_preview.helpers
  randomImg: ->
    return Math.random() < 0.5
  listItems: ->
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
