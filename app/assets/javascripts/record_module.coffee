$(document).on 'click', '.record_module', ->
  $.ajax
    url: "plants/#{$(this).data('id')}",
    dataType: 'script'
