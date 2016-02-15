# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

root = exports ? this

$(document).on 'click', '.cruddy_resource .compact', ->
  collapse $('.full')
  table = $(this).closest('.cruddy_table').attr 'id'
  id = $(this).closest('.cruddy_resource').data 'resource-id'

  $.ajax
    url: "/#{table}/#{id}"
    dataType: 'script'
  false

$(document).on 'click', '.cruddy_resource .compact a', (event) ->
  event.stopPropagation()

$(document).on 'click', '.cruddy_resource .collapse', ->
  collapse $(this).closest '.full'

collapse = (full) ->
  full.slideUp()
  timeout 250, ->
    full.closest('.cruddy_resource').find('.compact').show()
    full.remove()

$(document).on 'click', '[data-collapse]', ->
  full = $('.cruddy_table').find('.full')
  full.slideUp('fast')
  timeout 250, ->
    full.closest('.cruddy_resource').find('.compact').show()
    full.remove()

root.find_crud = (id) ->
  $(".cruddy_resource[data-resource-id=#{id}]");

$(document).on 'click', '#new_crud', ->
  $(this).removeClass 'look_at_me'
