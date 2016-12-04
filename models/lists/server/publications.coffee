# client/models/lists/server/publications.coffee


# DESC
#   Publish all lists or with limit
# PARAMS
#   {Integer?}  limit (optional)
#
Meteor.publish 'lists.all', (limit=0) ->

  Lists.find {},
    sort: created_at: -1
    limit: limit


# DESC
#   Publish one list with its given id
#  PARAMS
#   {String}   _id of the list
#
Meteor.publish 'lists.id', (_id) ->

  Lists.find _id


