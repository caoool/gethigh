# models/lists/methods.coffee


# !!!
#   MUST BE A LOGGED IN USER TO CALL THIS METHOD
# DESC
#   Insert a new list into lists collection
# PARAMS
#   {Object?}     list -> optional
#     {String?}   name -> optional, name of the list
# TODO
#   Add validation and user check
insert = new ValidatedMethod

  name: 'lists.insert'
  validate: null
  run: (list=null) ->
    Lists.insert list


# !!!
#   MUST BE A LOGGED IN USER TO CALL THIS METHOD
# DESC
#   Update a list
# PARAMS
#   {Object}    list
#     {String}  _id -> must provide _id
#     {String?} name -> optional
# TODO
#   Add validation and user check
update = new ValidatedMethod

  name: 'lists.update'
  validate: null
  run: (list) ->
    Lists.update list._id, $set: list


# !!!
#   MUST BE A LOGGED IN USER TO CALL THIS METHOD
# DESC
#   Remove a list
# PARAMS
#   {String}  _id
# TODO
#   Add validation and user check
remove = new ValidatedMethod

  name: 'lists.remove'
  validate: null
  run: (_id) ->
    Lists.remove _id
