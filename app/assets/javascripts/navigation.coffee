root = exports ? this

$(document).on 'click', '#header_left', ->
  navigate 'welcome'
$(document).on 'click', '#my_profile_link', ->
  navigate 'my_profile'


$(document).on 'click', '.dropper', ->
  $('#header').find('.dropper').removeClass 'selected'
  $(this).addClass 'selected'
  dropdown = $(this).closest('li').find('.drop_down_nav')
  dropdown.addClass 'active'
#  $(document).one 'click', ->
#    dropdown.removeClass 'active'

$(document).on 'click', ->
  $('.drop_down_nav').removeClass 'active'

$(document).on 'click', '.nav_link', ->
  $('.drop_down_nav').removeClass 'active'
  navigate this

navigate = (selector, push_state = true) ->
  $('#header').find('.nav_link').removeClass 'selected'
  $(selector).addClass 'selected'
  $('.dropper').removeClass 'selected'
  $(selector).parents('li:eq(1)').find('.dropper').addClass 'selected'

  cloak '#content'
  if push_state
    window.history.pushState( {} , '', $(selector).attr('href') );

  changeTheme = ->
    $('body').attr 'class', $(selector).data('theme')
  window.setTimeout changeTheme, 290


$ ->
  decloak('#content')
  if (typeof history.pushState == "function")
    window.onpopstate = ->
      cloak '#content'
      shit = window.location.href.split '/'
      path = shit[shit.length-1]

      navigate path, false
      $.ajax
        url: window.location.href,
        dataType: 'script'

#$(document).on 'click', '.drop_down_nav', ->
#  $(this).hide()

$(document).on 'click', '[data-fade-content]', ->
  if $(this).data('fade-content')
    cloak('.content')

$(document).on 'click', '[data-swap-title]', ->
  new_title = $(this).data 'swap-title'
  swap_title new_title

$(document).on 'click', '[data-hide-title]', ->
  hide_title()

root.hide_title = ->
  $('.card_header').addClass 'hidden'

root.swap_title = (new_title) ->
  hide_title()
  poop = ->
    $('.card_header h2').html new_title
  schoop = ->
    $('.card_header').removeClass 'hidden'
  window.setTimeout poop, 300
  window.setTimeout schoop, 310