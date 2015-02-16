$(document).on 'click', '#issues_link', ->
  navigate 'issues'

$(document).on 'click', '#users_link', ->
  navigate 'users'

$(document).on 'click', '#my_profile_link', ->
  navigate 'my_profile'

navigate = (section) ->
  selector = '#' + section + '_link'
  $('#header_right nav').closest('nav').find("a:not("+ selector + ")").removeClass('selected');
  $(selector).addClass 'selected'
  hide('#container')
  window.history.replaceState( {} , '', '/' + section );
  