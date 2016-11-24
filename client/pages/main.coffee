# client/pages/main.coffee


Template.main.onCreated ->

  @subscribe 'lists.all'


Template.main.helpers

  lists: ->
    Lists.find()
