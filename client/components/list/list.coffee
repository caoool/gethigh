# client/components/list.coffee


Template.list.onCreated ->

  @subscribe 'items.inList', Template.instance().data['_id']


Template.list.events

  'click .list #new_item': (e) ->
    e.preventDefault()

    item =
      list_id: @_id
    Meteor.call 'items.insert', item


  'focusout .list #name': (e) ->
    e.preventDefault()

    oldName = Template.instance().data['name']
    newName = e.target.value
    return if oldName == newName

    list =
      _id: @_id
      name: newName
    Meteor.call 'lists.update', list


  'click .list #delete': (e) ->
    e.preventDefault()

    Meteor.call 'lists.remove', {@_id}

  'click .list #follow': (e) ->
    e.preventDefault()
    followed_by = Meteor.userId()
    Meteor.call 'lists.follow', {@_id, followed_by}
    Meteor.call 'users.follow', {@_id, followed_by}


Template.list.helpers

  items: ->
    Items.find list_id: Template.instance().data['_id']
