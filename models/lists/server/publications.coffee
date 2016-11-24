# client/models/lists/server/publications.coffee


# DESC
#   Publish all lists
#
Meteor.publish 'lists.all', ->

  Lists.find()
