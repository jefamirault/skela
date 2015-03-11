# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'click', '.tic_tac_toe_square', ->
  if $(this).hasClass 'X' || $(this).hasClass 'O'
    return false
  if player_ones_turn()
    $(this).addClass 'X'
  else if player_twos_turn()
    $(this).addClass 'O'
  else
    console.log "error - neither player one's nor player two's turn"

  increment_turn '.tic_tac_toe_board'


player_ones_turn = ->
  turn_number = parseInt $('.tic_tac_toe_board').attr 'data-turn'
  turn_number % 2 == 1

player_twos_turn = ->
  turn_number = parseInt $('.tic_tac_toe_board').attr 'data-turn'
  turn_number % 2 == 0


increment_turn = (board_selector) ->

  turn_number = parseInt $(board_selector).attr 'data-turn'
  $(board_selector).attr('data-turn', (turn_number + 1) % 2)
