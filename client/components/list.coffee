# client/components/list.coffee


Template.list.onCreated ->

  @subscribe 'items.inList', Template.instance().data['_id']

Template.list.helpers

  items: ->
    Items.find list_id: Template.instance().data['_id']
