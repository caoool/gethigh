MENU_SELECTED_PAGE = new ReactiveVar('home')

Template.user_page.events
  'click .menu_item': (e) ->
    e.preventDefault()
    $('.menu_item').removeClass 'selected'
    $(e.currentTarget).addClass 'selected'
    MENU_SELECTED_PAGE.set($(e.currentTarget)[0].id)
    console.log(MENU_SELECTED_PAGE)


Template.user_page.helpers
  currentTemplate: ->
    switch MENU_SELECTED_PAGE.get()
      when 'home' then 'user_home'
      when 'profile' then 'user_profile'
      when 'settings' then 'user_settings'
      else 'page_not_found'
