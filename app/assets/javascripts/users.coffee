# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'click', '#user_select a.edit_user, #user_select tr.show_path', ->
#  $('#user_form h1').html 'Edit User'
#  $('#user_form').removeClass 'hidden'
  $('#user_form').addClass 'hidden'

$(document).on 'click', '#user_select a.new_user', ->
#  $('#user_form h1').html 'New User'
  $('#user_form').addClass 'hidden'

$(document).on 'click', '#delete_user', ->
  user_id = $(this).data('user-id');
  selector = 'tr[data-user-id=' + user_id + ']'

  cloak_row = ->
    cloak selector
  cloak_row()

  hide_row = ->
    hide selector
  window.setTimeout hide_row, 450

cloak = (selector) ->
  $(selector).addClass('invisible')
