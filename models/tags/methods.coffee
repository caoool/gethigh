
# !!!
#   MUST BE A LOGGED IN USER TO CALL THIS METHOD
# DESC
#   Insert a new tag into tags collection
# PARAMS
#   {Object?}     tag -> optional
#     {String?}   name -> optional, name of the tag
#
insert = new ValidatedMethod
  name: 'tags.insert'

  validate: new SimpleSchema
    name:
      type: String
      optional: true
  .validator()

  run: (tag=null) ->
    throw new Meteor.Error 'unauthorized', 'You must be logged in to add a new tag!' if !@userId
    tags.insert tag


# !!!
#   MUST BE A LOGGED IN USER TO CALL THIS METHOD
# DESC
#   Update a tag
# PARAMS
#   {Object}    tag
#     {String}  _id -> must provide _id
#     {String?} name -> optional
#
update = new ValidatedMethod
  name: 'tags.update'

  validate: new SimpleSchema
    _id:
      type: String
      regEx: SimpleSchema.RegEx.Id
    name:
      type: String
      optional: true
  .validator()

  run: (tag) ->
    throw new Meteor.Error 'unauthorized', 'You must be logged in to update a tag!' if !@userId
    tags.update tag._id, $set: tag


# !!!
#   MUST BE A LOGGED IN USER TO CALL THIS METHOD
# DESC
#   Remove a tag
# PARAMS
#   {String}  _id
#
remove = new ValidatedMethod
  name: 'tags.remove'

  validate: new SimpleSchema
    _id:
      type: String
      regEx: SimpleSchema.RegEx.Id
  .validator()

  run: ({_id}) ->
    throw new Meteor.Error 'unauthorized', 'You must be logged in to delete a tag!' if !@userId
    tags.remove _id