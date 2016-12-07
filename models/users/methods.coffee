
# !!!
#   MUST BE A LOGGED IN USER TO CALL THIS METHOD
# DESC
#   Remove a list
# PARAMS
#   {String}  _id
#
follow = new ValidatedMethod

  name: 'users.follow'

  validate: null

  run: (_id) ->
    throw new Meteor.Error 'unauthorized', 'You must be logged in to delete a list!' if !@userId
    Meteor.users.update @userId, $push: 'profile.following_list': _id

# !!!
#   MUST BE A LOGGED IN USER TO CALL THIS METHOD
# DESC
#   Remove a list
# PARAMS
#   {String}  _id
#
unfollow = new ValidatedMethod

  name: 'users.unfollow'

  validate: null

  run: (_id) ->
    throw new Meteor.Error 'unauthorized', 'You must be logged in to delete a list!' if !@userId
    Meteor.users.update @userId, $pull: 'profile.following_list': _id