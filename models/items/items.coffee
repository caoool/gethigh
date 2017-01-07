# models/items/items.coffee
# A item represents a single todo entry inside a todo list
# This file defines its schema


class ItemsCollection extends Mongo.Collection
  # Overwrite super class to modify our intended behaviours
  # We will probably modify these functions later
  insert: (item, callback) ->
    super item, callback

  update: (selector, modifier, callback) ->
    super selector, modifier, callback

  # Things like removing a list will remove all its associated items
  # can ben defined here with thin overwritten method
  remove: (selector, callback) ->
    super selector, callback


# @ -> this. in coffeescript make this variable global scope
@Items = new ItemsCollection 'items'


# Some hooks can be defined here in between


# Denying all database modification made by client side for security
Items.deny
  insert: -> yes
  update: -> yes
  remove: -> yes


# Using SimpleSchema and Collection2 packages to define schema of a collection
# MongoDB intially is free style -> no schema required
Items.schema = new SimpleSchema
  list_id:
    type: String
    regEx: SimpleSchema.RegEx.Id

  content:
    type: String
    optional: true

  checked:
    type: Boolean
    defaultValue: no

  finishers:
    type: [String]
    defaultValue: []

  created_by:
    type: String
    regEx: SimpleSchema.RegEx.Id
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

Items.attachSchema Items.schema


Items.publicFields =
  list_id:    1
  content:    1
  checked:    1
  finishers:  1
  created_by: 1
  created_at: 1


# Factory package used to generate testing database
# Often coupled with faker package 'faker.js'
Factory.define 'item', Items,
  list_id: ->
    Factory.get 'list'

  content: ->
    faker.lorem.sentence()


Items.helpers
  list: ->
    Lists.findOne @list_id

  isOwner: ->
    @created_by == Meteor.userId()

  followersCount: ->
    list = Lists.findOne @list_id
    return list.followers.length
