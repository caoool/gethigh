# models/lists/methods.coffee


# !!!
#   MUST BE A LOGGED IN USER TO CALL THIS METHOD
# DESC
#   Insert a new list into lists collection
# PARAMS
#   {Object?}     list -> optional
#     {String?}   name -> optional, name of the list
#
insert = new ValidatedMethod
  name: 'lists.insert'

  validate: new SimpleSchema
    name:
      type: String
      optional: true
  .validator()

  run: (list=null) ->
    throw new Meteor.Error 'unauthorized', 'You must be logged in to add a new list!' if !@userId
    Lists.insert list


# !!!
#   MUST BE A LOGGED IN USER TO CALL THIS METHOD
# DESC
#   Update a list
# PARAMS
#   {Object}    list
#     {String}  _id -> must provide _id
#     {String?} name -> optional
#
update = new ValidatedMethod
  name: 'lists.update'

  validate: new SimpleSchema
    _id:
      type: String
      regEx: SimpleSchema.RegEx.Id
    name:
      type: String
      optional: true
  .validator()

  run: (list) ->
    throw new Meteor.Error 'unauthorized', 'You must be logged in to update a list!' if !@userId
    Lists.update list._id, $set: list


# !!!
#   MUST BE A LOGGED IN USER TO CALL THIS METHOD
# DESC
#   Remove a list
# PARAMS
#   {String}  _id
#
remove = new ValidatedMethod
  name: 'lists.remove'

  validate: new SimpleSchema
    _id:
      type: String
      regEx: SimpleSchema.RegEx.Id
  .validator()

  run: ({_id}) ->
    throw new Meteor.Error 'unauthorized', 'You must be logged in to delete a list!' if !@userId
    Lists.remove _id


# !!!
#   MUST BE A LOGGED IN USER TO CALL THIS METHOD
# DESC
#   Star a list (save)
# PARAMS
#   {Object}    list
#     {String}  _id -> must provide _id
#
follow = new ValidatedMethod
  name: 'lists.star'

  validate: new SimpleSchema
    _id:
      type: String
      regEx: SimpleSchema.RegEx.Id
  .validator()

  run: ({_id}) ->
    throw new Meteor.Error 'unauthorized', 'You must be logged in to star a list!' if !@userId
    Lists.update _id, $push: followed_by: @userId


# !!!
#   MUST BE A LOGGED IN USER TO CALL THIS METHOD
# DESC
#   Unstar a list (unsave)
# PARAMS
#   {Object}    list
#     {String}  _id -> must provide _id
#
unfollow = new ValidatedMethod
  name: 'lists.unstar'

  validate: new SimpleSchema
    _id:
      type: String
      regEx: SimpleSchema.RegEx.Id
  .validator()

  run: ({_id}) ->
    throw new Meteor.Error 'unauthorized', 'You must be logged in to unstar a list!' if !@userId
    Lists.update _id, $pull: followed_by: @userId
