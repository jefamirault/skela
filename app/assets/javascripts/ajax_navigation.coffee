$(document).on 'click', '#header_left', ->
  navigate 'welcome'

$(document).on 'click', '#issues_link', ->
  navigate 'issues'

$(document).on 'click', '#users_link', ->
  navigate 'users'

$(document).on 'click', '#my_profile_link', ->
  navigate 'my_profile'

$(document).on 'click', '#courses_link', ->
  navigate 'courses'

$(document).on 'click', '#purchases_link', ->
  navigate 'purchases'

$(document).on 'click', '#login_link', ->
  navigate '/'

navigate = (section) ->
  if section != '/'
    selector = '#' + section + '_link'
    $('#header_right nav').closest('nav').find("a:not("+ selector + ")").removeClass('selected');
    $(selector).addClass 'selected'

  cloak '#container'
  window.history.replaceState( {} , '', '/' + section );


$ ->
  decloak('#container')
