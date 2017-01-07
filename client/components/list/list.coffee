# client/components/list.coffee


Template.list.onCreated ->
  @subscribe 'items.inList', Template.instance().data['_id']

Template.list.onRendered ->
  if window.iso
    window.iso.insert Template.instance().firstNode.parentNode

Template.list.events
  'click .list #new_item': (e) ->
    e.preventDefault()
    item =
      list_id: @_id
    Meteor.call 'items.insert', item
     #check finisher
    Meteor.call 'lists.finish', {@_id}

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
    if window.iso
      window.iso.arrange()

  'click .list #star': (e) ->
    e.preventDefault()
    star = !this.isStarred()
    Meteor.call 'lists.star', {@_id, star}

  'click .list #follow': (e) ->
    e.preventDefault()
    follow = !this.isFollowed()
    Meteor.call 'lists.follow', {@_id, follow}



Template.list.helpers
  items: ->
    Items.find list_id: Template.instance().data['_id']
