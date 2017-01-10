
Template.list_preview.onRendered ->
  if window.iso
    window.iso.insert Template.instance().firstNode.parentNode
Template.list_preview.helpers
  randomImg: ->
    return Math.random() < 0.5
