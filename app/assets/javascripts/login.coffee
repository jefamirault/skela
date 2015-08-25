# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

root = exports ? this

# Login
root.login_attempt = ->
  $('#login_button').val 'Logging in...'
  $(this).find('.center_form_field input').addClass 'disabled'
  $('.flash').addClass 'hidden'

$(document).on 'submit', '#center_form_box form', root.login_attempt

root.login_success = (notice, content, user_nav) ->
  $('#login_button').val 'Success!'
  cloak('#user_nav')
  poop = ->
    swap_title 'Welcome to skela!'
    $('#user_nav').html(user_nav)
    decloak '#user_nav'
  setTimeout poop, 500
  $('#center_form_box').find('input').attr 'disabled', true
  setTimeout hide_content, 500
  reveal_content = ->
    new_content(content);
  setTimeout reveal_content, 1000
  flashNotice(notice);

new_content = (content) ->
  $('.content').html content
  decloak('.content')

hide_content = ->
  cloak('.content')

hide_helmet = ->
  $('#helmet').addClass 'hidden'

# Logout

root.logout = ->
  setTimeout hide_content, 300

$(document).on 'click', '#logout_button', root.logout

# Validations

root.clientSideValidations = ->
  $('.flash').addClass 'hidden'
  if $('#user_password').val() != $('#user_password_confirmation').val()
    $('.flash.alert').html 'Password confirmation does not match'
    $('#user_password_confirmation').val ''
    $('#user_password').val('').focus()
    $('.flash.alert').removeClass 'hidden'

    return false
