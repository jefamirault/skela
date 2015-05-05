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

# Issues
root.initializeIssuesTable = ->
  $('#issues').dataTable
    "order": [[ 0, "desc" ]]
    "iDisplayLength": 50
    "aoColumnDefs": [{ "iDataSort": 8, "aTargets": [7] },{ "iDataSort": 10, "aTargets": [9] }]

$(document).ready ->
  initializeIssuesTable()

# Users
#$(document).ready ->
#  $('#users').dataTable
#    "order": [[ 0, "desc" ]]
#    "iDisplayLength": 25

$(document).on 'click', '.show_path', ->
  table = $(this).closest('table').attr 'id'
  id = $(this).data 'object-id'
  $.ajax
    url: "/#{table}/#{id}/edit"
    dataType: 'script'
  history.replaceState( {} , '', "/#{table}/#{id}/edit" )
