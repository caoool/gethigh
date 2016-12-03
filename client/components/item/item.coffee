# client/components/item-edit.coffee


Template.item.events

  'change .item #check': (e) ->
    e.preventDefault()

    item =
      _id: @_id
      checked: e.target.checked
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
