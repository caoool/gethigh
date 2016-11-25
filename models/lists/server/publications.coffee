# client/models/lists/server/publications.coffee


# DESC
#   Publish all lists or with limit
# PARAMS
#   {Integer?}  limit (optional)
#
Meteor.publish 'lists.all', (limit=0) ->

  Lists.find {}, limit: limit
