# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'click', '#user_select a.edit_user', ->
  $('#user_form').removeClass 'hidden'

$(document).on 'click', '#user_select a.new_user', ->
  $('#user_form h1').html 'New User'
  $('#user_form').removeClass 'hidden'
