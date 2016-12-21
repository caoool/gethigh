# client/components/item.coffee


Template.item.events
  'click .item #check': (e) ->
    e.preventDefault()
    item =
      _id: @_id
      checked: !Template.instance().data['checked']
    Meteor.call 'items.update', item

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
