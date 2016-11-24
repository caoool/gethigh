# server/factory.coffee


# !!!
#   CAN ONLY BE CALLED WITH A LOGGED IN USER
#   CLIENT SIDE ONLY METEOR SHELL WILL NOT WORK
# DESC
#   A server only method (because factory uses faker.js)
#   Generate fake data for testing
# HOWTO
#   Name 'factory' does not matter because it will be
#   called using Meteor.call then 'items.methods.factory'
#   since it is a server only method
#
factory = new ValidatedMethod

  name: 'factory'
  validate: null
  run: ->
    _.times randomNumber(50, 30), ->
      list = Factory.create 'list'
      _.times randomNumber(15, 5), ->
        Factory.create 'item', list_id: list._id
