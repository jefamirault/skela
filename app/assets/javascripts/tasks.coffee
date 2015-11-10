$(document).on 'click', '.task_status', ->
# hackeroo
  thing = $(this)
  timeout 150, -> thing.toggleClass 'complete'
