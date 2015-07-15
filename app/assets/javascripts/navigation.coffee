$(document).on 'click', '#header_left', ->
  navigate 'welcome'
$(document).on 'click', '#my_profile_link', ->
  navigate 'my_profile'
$(document).on 'click', '#login_link', ->
  navigate '/'

$(document).on 'click', '.nav_link', ->
  $('#header_right').find('a').removeClass('selected')
  $(this).addClass('selected')
  cloak '#container'
  window.history.pushState( {} , '', $(this).attr('href') );
  $('body').attr 'class', $(this).data('controller')

$ ->
  decloak('#container')
  if (typeof history.pushState == "function")
    window.onpopstate = ->
      cloak '#container'
      shit = window.location.href.split '/'
      path = shit[shit.length-1]
      navigate path, false
      $.ajax
        url: window.location.href,
        dataType: 'script'
