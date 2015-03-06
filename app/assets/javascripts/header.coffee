$(document).on 'click', '.flash', ->
  $(this).addClass 'hidden'

$(document).on 'click', '#toggle_header', ->
  $('#helmet').toggleClass 'hidden'
