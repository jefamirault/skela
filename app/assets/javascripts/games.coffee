# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

root = exports ? this

#################
## Tic-Tac-Toe ##
#################

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

###########
## Hi-Lo ##
###########

root.getUserGuess = ->
  incrementAttempts()
  parseInt $('#guess').val()

root.generateWinningNumber = (range) ->
  Math.floor Math.random()*(range+1)

root.clearUserGuess = ->
  $('#guess').val('').focus()

incrementAttempts = ->
  attempts = parseInt $('#number_of_attempts').html()
  $('#number_of_attempts').html(attempts + 1);

################
## 100-Puzzle ##
################

root.columnSum = (index) ->
  sum = 0
  for row in [0..4]
    sum += cell(row, index)
  Math.round sum

root.cell = (row, col) ->
  parseFloat getCell(row, col).html()

root.setRow = (index, row) ->
  for col in [0..4]
    setCell(index, col, row[col])

getCell = (row, col) ->
  $('#hundred_tower').find("tr:eq(#{row})").find("td:eq(#{col})")

root.setCell = (row, col, value) ->
  getCell(row,col).html value

solved = ->
  columnSums = (columnSum(index) for index in [0..4])
  for sum in columnSums
    unless (Math.ceil sum) == 100
      return false
  true

root.check = ->
  if solved()
    alert 'Each sequence adds up to 100, you win!'


root.initHundredPuzzle = ->
  setRow(0, [18,14,25,18,25])
  setRow(1, [27,26,16,15,16])
  setRow(2, [13,17,18,35,17])
  setRow(3, [26,26,14,15,19])
  setRow(4, [16,17,27,17,23])
  updateSums()

  randomizeHundredPuzzle()

root.randomizeHundredPuzzle = ->
  for row in [0..4]
    rotateRow(row, Math.floor(Math.random()*4))
  updateSums()

root.rotateRow = (index, times) ->
  temp = cell(index, 0)
  for col in [0..4-1]
    setCell(index, col, cell(index, col+1))
  setCell(index, 4, temp)
  if times > 1
    rotateRow(index, times-1)

$(document).on 'click', '#rotate_left', ->
  row = $(this).data 'row'
  cloakRow row
  shit = ->
    rotateRow row
    updateSums()
    fuck = ->
      cloakRow row
      check()
    window.setTimeout(fuck, 100)
  window.setTimeout(shit, 300)

$(document).on 'click', '#rotate_right', ->
  row = $(this).data 'row'
  cloakRow row
  shit = ->
    for i in [1..4]
      rotateRow row
    updateSums()
    fuck = ->
      cloakRow row
      check()
    window.setTimeout(fuck, 100)

  window.setTimeout(shit, 300)

updateSums = ->
  cells = $('#sums').find 'td'
  for col in [0..4]
    $(cells[col]).html(columnSum(col))

root.cloakRow = (index) ->
  row = $('#hundred_tower').find("tr:eq(#{index})")
  toggleCloak($(row))
  toggleCloak($('#sums tr'))
