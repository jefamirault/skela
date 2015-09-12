# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'click', '#new_task', ->
  $('#tasks').append('<div class="task_space minimized"></div>')
  minimize = ->
    $('.task_space:last').removeClass('minimized')
  setTimeout minimize, 1

$(document).on 'click', '.task .destroy_task', ->
  cloak($(this).closest('.task'))

$(document).on 'click', '.task_assignee', ->
  $(this).find('.text:first').hide()
  $(this).find('.text:eq(1)').show()
