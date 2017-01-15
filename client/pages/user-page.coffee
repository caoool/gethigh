window.MENU_SELECTED_PAGE = new ReactiveVar('home')

Template.user_page.events
  'click .menu_item': (e) ->
    e.preventDefault()
    $('.menu_item').removeClass 'selected'
    $(e.currentTarget).addClass 'selected'
    window.MENU_SELECTED_PAGE.set($(e.currentTarget)[0].id)

Template.user_page.helpers
  currentTemplate: ->
    switch window.MENU_SELECTED_PAGE.get()
      when 'home' then 'user_home'
      when 'profile' then 'user_profile'
      when 'settings' then 'settings'
      when 'list_detail' then 'list_detail'
      else 'page_not_found'
