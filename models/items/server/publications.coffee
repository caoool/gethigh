## client/models/items/server/publications.coffee


# DESC
#   This is a simplest publication with one parameter
#   Publish all items within a list
# PARAMS
#   {String} list_id
#
Meteor.publish 'items.inList', (list_id)->

	Items.find
    list_id: list_id
