# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

root = exports ? this

$(document).on 'click', '.cruddy_resource .compact', ->
  collapse $('.full')
  table = $(this).parent().data('type') + 's'
  id = $(this).closest('.cruddy_resource').data 'resource-id'
  if (id != undefined)
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

$(document).on 'click', '.new_crud', ->
  $(this).removeClass 'look_at_me'
$(document).on 'click', '.new_crud', ->
  collapse $('.full')

root.locate = (type, id) ->
  $("[data-type=#{type}][data-resource-id=#{id}]");

focus_field = (container) ->
  if (container.find('textarea').size() > 0)
    container.find('textarea:first').focus()
  else
    container.find('input:not([type=hidden]):first').focus()

$(document).on 'click', 'a[data-add-field], span.read', ->
  container = $(this).parent()
  form = $(this).find('template.edit')
  $(this).replaceWith(form.html())
  if (container.find('textarea').size() > 0)
    container.find('textarea:first').focus()
  else
    container.find('input:not([type=hidden]):first').focus()

$(document).on 'click', '.new_crud_link', ->
  table = $(this).closest('.category').find '.cruddy_table'
  if table.find('.new_crud_form').size() == 0
    form = $(this).find('template.new')
    table.prepend form.html()

  table.find('.new_crud_form .focus_target').focus()

$(document).on 'click', '.cruddy_resource.new', ->

root.scrollToView = (element) ->
  current = $(element).offset().top
  bottom = $('html').height() - element.height() - 15
  toGo = if current < 73
    73 - current
  else if current > bottom
    bottom - current
  else 0
  scrollUp(toGo)

root.scrollTo = (position) ->
  $('#main').animate({
    scrollTop: position
  })

root.crudOffset = ->
  $('.full').offset()

root.currentScroll = ->
  0 - ($($('#main').children()[0]).offset().top - $('#header').height())

root.scroll = (distance) -> scrollDown(distance)

root.scrollDown = (distance) ->
  scrollTo(currentScroll() + distance)

root.scrollUp = (distance) ->
  scrollTo(currentScroll() - distance)
