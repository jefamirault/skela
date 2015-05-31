root = exports ? this

$(document).on 'change', '#column_select input[type=checkbox]', ->
  if $(this).prop('checked')
    showColumn($(this).attr('id'))
  else
    hideColumn($(this).attr('id'))

hideColumn = (column) ->
  $('[data-column=' + column + ']').hide()
showColumn = (column) ->
  $('[data-column=' + column + ']').show()


$(document).on 'click', '.show_path', ->
  table = $(this).closest('table').attr 'id'
  id = $(this).data 'object-id'
  $.ajax
    url: "/#{table}/#{id}/edit"
    dataType: 'script'
  history.pushState( {} , '', "/#{table}/#{id}/edit" )
