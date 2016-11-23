# client/handlebar-helpers.coffee
# This is where all handlebar helpers are located
# Handlebar helpers are used to do functions in templates


# DESC
#   Loop block n times in template
# EXAMPLE
#   #{#times 10}
#
Handlebars.registerHelper 'times', (n, block) ->
  (block.fn(i) for i in [0...n]).join ''
