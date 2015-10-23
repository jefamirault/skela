$(document).on 'click', '.task_status', ->
# hackeroo
  timeout 150, -> $('.task_status').toggleClass 'complete'
