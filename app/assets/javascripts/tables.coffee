$(document).on 'change', '#column_select input[type=checkbox]', ->
  if $(this).prop('checked')
    showColumn($(this).attr('id'))
  else
    hideColumn($(this).attr('id'))

hideColumn = (column) ->
  $('[data-column=' + column + ']').hide()
showColumn = (column) ->
  $('[data-column=' + column + ']').show()


$(document).ready ->
  $('#issues').dataTable
    "order": [[ 0, "desc" ]]
    "iDisplayLength": 25
#    "spaginationType": "full_numbers"

$(document).ready ->
  $('#users').dataTable
    "order": [[ 0, "desc" ]]
    "iDisplayLength": 25

$(document).on 'click', '.show_path', ->
  table = $(this).closest('table').attr 'id'
  id = $(this).data 'object-id'
  $.ajax
    url: "/#{table}/#{id}/edit"
    dataType: 'script'
#    error: (jqXHR, textStatus, errorThrown) ->
#      $('body').append "AJAX Error: #{textStatus}"
#    success: (data, textStatus, jqXHR) ->
#      $('body').append "Successful AJAX call: #{data}"
  history.replaceState( {} , '', "/#{table}/#{id}/edit" )
