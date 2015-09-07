# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#$(document).on 'click', '#issues_index', ->
#  window.history.replaceState( {} , '', '/issues' );

$(document).on 'click', '.task_status', ->
#  $(this).addClass 'hover'
#  $(this).on 'mouseleave', ->
#    $(this).removeClass 'hover'
  status = $(this).find('.text').html()
  text = $(this).find '.text'
  cloakAndSwap(text, opposite(status))


opposite = (status) ->
  if status == 'Complete'
    'Incomplete'
  else if status == 'Incomplete'
    'Complete'

cloakAndSwap = (selector, newContent) ->
  cloak selector
  reveal = ->
    $(selector).closest('.task_status').toggleClass 'complete'
    $(selector).html(newContent)
    decloak selector
  window.setTimeout reveal, 400
