# models/lists/lists.coffee
# A list is a basic unit of our application
# A list have multiple items in it act as todos


class ListsCollection extends Mongo.Collection
  insert: (list, callback) ->
    super list, callback

  update: (selector, modifier, callback) ->
    super selector, modifier, callback

  remove: (selector, callback) ->
    # Remove its items before remove the list itself
    Items.remove list_id: selector
    super selector, callback


@Lists = new ListsCollection 'lists'


Lists.deny
  insert: -> yes
  update: -> yes
  remove: -> yes


Lists.schema = new SimpleSchema
  name:
    type: String
    defaultValue: 'New List'

  followed_by:
    type: [String]
    defaultValue: []

  created_by:
    type: String
    # regEx: SimpleSchema.RegEx.Id
    autoValue: ->
      if @isInsert
        @userId
      else if @isUpsert
        $setOnInsert: @userId
      else
        @unset()

  created_at:
    type: Date
    autoValue: ->
      if @isInsert
        new Date
      else if @isUpsert
        $setOnInsert: new Date
      else
        @unset()


Lists.attachSchema Lists.schema


Lists.publicFields =
  name: 1
  followed_by: 1
  created_by: 1
  created_at: 1


Factory.define 'list', Lists,
  name: ->
    faker.lorem.words(3).join ' '


Lists.helpers
  items: ->
    Items.find
      list_id: @_id
    , sort:
      createdAt: -1

  isOwner: ->
    @created_by == Meteor.userId()

  isFollowedBy: ->
    Meteor.userId() in @followed_by
