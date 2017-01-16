# models/lists/lists.coffee
# A list is a basic unit of our application
# A list have multiple items in it act as todos


class TagsCollection extends Mongo.Collection
  insert: (tag, callback) ->
    super tag, callback

  update: (selector, modifier, callback) ->
    super selector, modifier, callback

  remove: (selector, callback) ->
    super selector, callback


@Tags = new TagsCollection 'tags'


Tags.deny
  insert: -> yes
  update: -> yes
  remove: -> yes


Tags.schema = new SimpleSchema
  name:
    type: String


Tags.attachSchema Tags.schema


Tags.publicFields =
  name: 1
  star_by: 1
  created_by: 1
  created_at: 1
  followers: 1
  finishers: 1
  tags: 1

