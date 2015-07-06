$(document).on 'click', '.open_portal', ->
  mana = parseInt $('#mana').html()
  mana -= 10
  if (!$(this).hasClass('travel_portal'))
    $('#mana').html(mana.toString())
  $(this).addClass 'travel_portal'

