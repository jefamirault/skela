$(document).on 'change', '.ajax_field', ->
  $(this).closest('form').submit()

$(document).on 'change', 'form.datetime[data-remote=true]', ->
  $(this).submit()
