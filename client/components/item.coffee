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

    oldName = Items.findOne().name
    newName = e.target.type
    return if oldName == newName

    item =
      _id: @_id
      content: newName
    Meteor.call 'items.update', item


  'click .item #delete': (e) ->
    e.preventDefault()

    Meteor.call 'items.remove', @_id
