
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

  run: (data) ->
    throw new Meteor.Error 'unauthorized', 'You must be logged in to delete a list!' if !@userId
    Meteor.users.update {_id: @userId}, $push: 'profile.following_list': data._id
