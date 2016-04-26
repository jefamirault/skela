root = exports ? this

$(document).on 'click', '.nav_link', ->
  window.history.pushState( {} , '', $(this).attr('href') );

navigate = (selector, push_state = true) ->
  $('#header').find('.nav_link').removeClass 'selected'
  $(selector).addClass 'selected'
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

replaceAndDecloak = (selector, partial) ->
  timeout 300, -> $(selector).replaceWith partial
  timeout 320, -> decloak(selector)

root.replaceContentAndDecloak = (partial) ->
  replaceAndDecloak '.content', partial

root.timeout = (delay, callback) ->
  window.setTimeout callback, delay

$(document).on 'click', '#sidebar .button', ->
  $('#sidebar .button').removeClass 'selected'
  $(this).addClass 'selected'

$(document).on 'click', '.category_toggle', ->
  $(this).toggleClass 'selected'
  target = $(this).data 'toggle'
  $("##{target}").toggleClass 'hidden'

$(document).on 'click', '#sidebar a', ->
  $('#sidebar a').removeClass 'selected'
  $('#logged_in_user').removeClass 'selected'
  $(this).addClass 'selected'

$(document).on 'click', '#logged_in_user', ->
  $('#sidebar a').removeClass 'selected'
  $(this).addClass 'selected'
