# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'keydown', '#issue_form input, #issue_form select, #issue_form textarea', ->
  $(this).closest('form').submit()
