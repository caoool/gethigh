# client/components/list-edit.coffee


Template.list_edit.onCreated ->

  @subscribe 'lists.id', Router.current().params._id


Template.list_edit.events

  'click #list_edit.delete': (e) ->
    e.preventDefault()

    Meteor.call 'lists.remove', Router.current().params._id


  'focusout #list_edit.name': (e) ->
    e.preventDefault()

    oldName = Lists.findOne().name
    newName = e.target.value
    return if oldName == newName

    list =
      _id: Router.current().params._id
      name: newName
    Meteor.call 'lists.update', list


Template.list_edit.helpers

  list: ->
    Lists.findOne()
