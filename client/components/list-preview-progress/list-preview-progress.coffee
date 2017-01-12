Template.list_preview_progress.helpers
  randomImg: ->
    return Math.random() < 0.5
  randomPercentage: ->
    Math.floor(Math.random()* 100) + '%'

Template.list_preview_progress.onRendered ->
