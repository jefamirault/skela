root = exports ? this

$(document).on 'click', '.flash', ->
  $(this).addClass 'hidden'

$(document).on 'click', '#toggle_header', ->
  toggleHeader()


root.showHeader = ->
  $('#helmet').removeClass 'hidden'
  $('#container').addClass 'hasHeader'
root.hideHeader = ->
  $('#helmet').addClass 'hidden'
  $('#container').removeClass 'hasHeader'

root.toggleHeader = ->
  $('#helmet').toggleClass 'hidden'
  $('#container').toggleClass 'hasHeader'
