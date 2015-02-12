$(document).on 'change', '.ajax_field', ->
  $(this).closest('form').submit()
