# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'click', '#delete_user', ->
  user_id = $(this).data('user-id')
  selector = 'tr[data-user-id=' + user_id + ']'

  cloak_row = ->
    cloak selector
  cloak_row()

  hide_row = ->
    cloak selector
  window.setTimeout hide_row, 450

  window.history.replaceState( {} , '', '/users' )


cloak = (selector) ->
  $(selector).addClass('invisible')

$(document).on 'click', '#change_password', ->
  $('#password_form').toggleClass 'hidden'
  timeout 10, ->
    toggleCloak '#password_form'
  $('#user_password').focus()

$(document).on 'click', '#create_account', ->
  $('#create_account_form').toggleClass 'hidden'
  timeout 10, ->
    toggleCloak '#create_account_form'
  $('#user_username').focus()
