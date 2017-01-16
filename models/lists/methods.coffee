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
star = new ValidatedMethod
  name: 'lists.star'

  validate: new SimpleSchema
    _id:
      type: String
      regEx: SimpleSchema.RegEx.Id
    star:
      type: Boolean
  .validator()

  run: ({_id, star}) ->
    throw new Meteor.Error 'unauthorized', 'You must be logged in to star a list!' if !@userId
    if star 
      Lists.update _id, $push: star_by: @userId
    else
      Lists.update _id, $pull: star_by: @userId

# !!!
#   MUST BE A LOGGED IN USER TO CALL THIS METHOD
# DESC
#   Follow a list (save)
# PARAMS
#   {Object}    list
#     {String}  _id -> must provide _id
#
follow = new ValidatedMethod
  name: 'lists.follow'

  validate: new SimpleSchema
    _id:
      type: String
      regEx: SimpleSchema.RegEx.Id
    follow:
      type: Boolean
  .validator()

  run: ({_id, follow}) ->
    throw new Meteor.Error 'unauthorized', 'You must be logged in to follow a list!' if !@userId
    if follow 
      Lists.update _id, $push: followers: @userId
    else
      Lists.update _id, $pull: followers: @userId


# !!!
#   MUST BE A LOGGED IN USER TO CALL THIS METHOD
# DESC
#   Finish a list (unsave)
# PARAMS
#   {Object}    list
#     {String}  _id -> must provide _id
#
finish = new ValidatedMethod
  name: 'lists.finish'

  validate: new SimpleSchema
    _id:
      type: String
      regEx: SimpleSchema.RegEx.Id
    remove:
      type: Boolean
      optional: true
  .validator()

  run: ({_id, remove}) ->
    throw new Meteor.Error 'unauthorized', 'You must be logged in to finish a list!' if !@userId
    list = Lists.findOne _id
    for follower in list.followers
      # if items.count() == 0
      # TBD, if clear all finishers and followers when the items in list goes to zero 
      if follower in list.finishers && remove
        break
      items = Items.find {finishers: follower, list_id: _id}
      console.log(items.count())
      if items.count() == list.items().count()
        Lists.update _id, $push: finishers: @userId
      else 
        Lists.update _id, $pull: finishers: @userId



# !!!
#   MUST BE A LOGGED IN USER TO CALL THIS METHOD
# DESC
#   Tag a list (unsave)
# PARAMS
#   {Object}    list
#     {String}  _id -> must provide _id
#
tag = new ValidatedMethod
  name: 'lists.tag'

  validate: new SimpleSchema
    _id:
      type: String
      regEx: SimpleSchema.RegEx.Id
    tagId:
      type: String
    add:
      type: Boolean
  .validator()

  run: ({_id, tagId, add}) ->
    throw new Meteor.Error 'unauthorized', 'You must be logged in to tag a list!' if !@userId
    if add
      Lists.update _id, $push: tags: tagId
    else
      Lists.update _id, $pull: tags: tagId





