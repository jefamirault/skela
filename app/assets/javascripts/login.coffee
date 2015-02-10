# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

root = exports ? this
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

# Log out

$(document).on 'click', '#logout_button', ->
  setTimeout hide_helmet, 0
  setTimeout hide_container, 300
