$(document).on 'click', '#header_left', ->
  navigate 'welcome'
$(document).on 'click', '#my_profile_link', ->
  navigate 'my_profile'
$(document).on 'click', '#login_link', ->
  navigate '/'

$(document).on 'click', '.nav_link', ->
  navigate this

navigate = (selector, push_state = true) ->
  $('#header_right').find('a').removeClass('selected')
  $(selector).addClass('selected')
  cloak '#container'
  if push_state
    window.history.pushState( {} , '', $(selector).attr('href') );
  $('body').attr 'class', $(selector).data('theme')


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

$(document).on 'click', '.drop_down_nav', ->
  $(this).hide()
