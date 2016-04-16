# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

root = exports ? this

$(document).on 'click', '.cruddy_resource .compact', ->
  collapse $('.full')
  table = $(this).parent().data('type') + 's'
  id = $(this).closest('.cruddy_resource').data 'resource-id'

  $.ajax
    url: "/#{table}/#{id}"
    dataType: 'script'
  false

$(document).on 'click', '.cruddy_resource .compact a', (event) ->
  event.stopPropagation()

$(document).on 'click', '.cruddy_resource .collapse', ->
  collapse $(this).closest '.full'

root.collapse = (full) ->
  full.closest('.cruddy_resource').removeClass 'selected'
  full.slideUp()
  timeout 250, ->
    full.closest('.cruddy_resource').find('.compact').show()
    full.remove()

$(document).on 'click', '[data-collapse]', ->
  collapse $(this).closest('.full')

root.find_crud = (type, id) ->
  possible = locate(type, id)
  crud = possible.filter((x) -> $(possible[x]).hasClass('cruddy_resource'))

$(document).on 'click', '#new_crud', ->
  $(this).removeClass 'look_at_me'

root.locate = (type, id) ->
  $("[data-type=#{type}][data-resource-id=#{id}]");
