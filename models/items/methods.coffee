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
# TODO
#   Add validation and user check
insert = new ValidatedMethod

  name: 'items.insert'
  validate: null
  run: (item=null) ->
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
# TODO
#   Add validation and user check
update = new ValidatedMethod

  name: 'items.update'
  validate: null
  run: (item) ->
    Items.update item._id, $set: item


# !!!
#   MUST BE A LOGGED IN USER TO CALL THIS METHOD
# DESC
#   Remove an item
# PARAMS
#   {String}  _id
# TODO
#   Add validation and user check
remove = new ValidatedMethod

  name: 'items.remove'
  validate: null
  run: (_id) ->
    Items.remove _id
