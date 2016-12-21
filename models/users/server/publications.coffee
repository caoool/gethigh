# users/server/publications.coffee
# Here is all server publications for users collection
# Keep in mind there will be no client publications
# Because all publications need to be on server only


# !!!
#   BE SURE TO SUBSCRIBE 'userData' IN CLIENT SIDE
# DESC
#   'userData' is used for client to access user object
#   by default currentUser only have user.profile visible,
#   here we publish some basic information associated with
#   the user's login services
#
Meteor.publish 'userData', ->
  if @userId
    Meteor.users.find @userId,
      fields:
        'services.google.name': 1
        'services.google.picture': 1
        'services.facebook.name': 1
        'services.facebook.picture': 1
  else
    @ready()
