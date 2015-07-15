$(document).on 'click', '#header_left', ->
  navigate 'welcome'
$(document).on 'click', '#my_profile_link', ->
  navigate 'my_profile'
$(document).on 'click', '#login_link', ->
  navigate '/'

$(document).on 'click', '.nav_link', ->
  navigate $(this).data('path'), $(this).data('parent')


navigate = (section, parent_controller=section, push=true) ->
  unless section == '/'
    selector = "[data-path=" + parent_controller + "]"
    $('#header_right nav').closest('nav').find("a:not("+ selector + ")").removeClass 'selected'
    $(selector).addClass 'selected'
  $('body').attr 'class', parent_controller
  cloak '#container'
  if push
    window.history.pushState( {} , '', '/' + section );


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
