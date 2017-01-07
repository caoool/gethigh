

# DESC
#   Publish all tags or with limit
# PARAMS
#   {Integer?}  limit (optional)
#
Meteor.publish 'tags.all', (limit=0) ->
  Tags.find {},
    sort: created_at: -1
    limit: limit


# DESC
#   Publish one Tag with its given id
# PARAMS
#   {String}   _id of the list
#
Meteor.publish 'tags.id', (_id) ->
  Tags.find _id
