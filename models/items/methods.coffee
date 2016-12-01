# models/items/methods.coffee


# !!!
#   MUST BE A LOGGED IN USER TO CALL THIS METHOD
# DESC
#   Insert a new item into its list
# PARAMS
#   {Object}      item
#     {String}    list_id
#     {String?}   content -> optional
#     {bool?}     checked -> optional
#
insert = new ValidatedMethod

  name: 'items.insert'

  validate: new SimpleSchema
    list_id:
      type: String
    content:
      type: String
      optional: true
    checked:
      type: Boolean
      optional: true
  .validator()

  run: (item) ->
    throw new Meteor.Error 'unauthorized', 'You must be logged in to add a new item!' if !@userId
    Items.insert item


# !!!
#   MUST BE A LOGGED IN USER TO CALL THIS METHOD
# DESC
#   Update an item
#   To update one attribute, simply omit the other ones that
#   are no need for change
# PARAMS
#   {Object}    item
#     {String}  _id     -> must provide _id
#     {String?} list_id -> move to another list (must be same owner)
#     {String?} content -> optional
#     {String?} checked -> optional
#
update = new ValidatedMethod

  name: 'items.update'

  validate: new SimpleSchema
    _id:
      type: String
      regEx: SimpleSchema.RegEx.Id
    list_id:
      type: String
      optional: true
    content:
      type: String
      optional: true
    checked:
      type: Boolean
      optional: true
  .validator()

  run: (item) ->
    throw new Meteor.Error 'unauthorized', 'You must be logged in to update an item!' if !@userId
    Items.update item._id, $set: item


# !!!
#   MUST BE A LOGGED IN USER TO CALL THIS METHOD
# DESC
#   Remove an item
# PARAMS
#   {String}  _id
#
remove = new ValidatedMethod

  name: 'items.remove'

  validate: new SimpleSchema
    _id:
      type: String
      regEx: SimpleSchema.RegEx.Id
  .validator()

  run: ({_id}) ->
    throw new Meteor.Error 'unauthorized', 'You must be logged in to delete an item!' if !@userId
    Items.remove _id
