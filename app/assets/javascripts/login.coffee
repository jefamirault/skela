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

root.login_success = (notice, content, header) ->
  $('#login_button').val 'Success!'
  $('.flash.notice').html notice
  $('.flash.notice').removeClass 'hidden'
  $('#center_form_box').find('input').attr 'disabled', true
  setTimeout hide_container, 500
  build_header = ->
    new_content(content);
  setTimeout build_header, 1000
  $('#helmet').html header
  $('#helmet').removeClass 'hidden'

new_content = (content) ->
  $('#container').html content
  $('#container').removeClass 'hidden'

hide_container = ->
  $('#container').addClass 'hidden'

hide_helmet = ->
  $('#helmet').addClass 'hidden'

# Logout

root.logout = ->
  setTimeout hide_helmet, 0
  setTimeout hide_container, 300

$(document).on 'click', '#logout_button', root.logout

# Validations

root.clientSideValidations = ->
  $('.flash').addClass 'hidden'
  if $('#user_password').val() != $('#user_password_confirmation').val()
    $('.flash.alert').html 'Password confirmation does not match'
    $('#user_password').val ''
    $('#user_password_confirmation').val ''
    $('.flash.alert').removeClass 'hidden'
    return false
