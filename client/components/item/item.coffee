# client/components/item.coffee


Template.item.events
  'click .item #check': (e) ->
    e.preventDefault()
    data = Template.instance().data
    #Whether to add or remove userId to follower array
    if Meteor.userId() && !data['checked']
      data['finishers'].push(Meteor.userId())
    else if Meteor.userId() && data['checked']
      data['finishers'].splice(data['finishers'].indexOf(Meteor.userId()), 1)

    item =
      _id: @_id
      checked: !data['checked']
      finishers: data['finishers']
    Meteor.call 'items.update', item
     #check finisher
    _id = data['list_id']
    Meteor.call 'lists.finish', {_id}

  'focusout .item #content': (e) ->
    e.preventDefault()
    oldValue = Template.instance().data['content']
    newValue = e.target.value
    return if oldValue == newValue
    item =
      _id: @_id
      content: newValue
    Meteor.call 'items.update', item

  'click .item #delete': (e) ->
    e.preventDefault()
    Meteor.call 'items.remove', {@_id}
     #check finisher
    _id = Template.instance().data['list_id']
    Meteor.call 'lists.finish', {_id, remove: true}
