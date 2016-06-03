$(document).on 'blur', '.ajax_field', ->
  $(this).closest('form').submit()

$(document).on 'click', '[data-remove-parent-li=true]', ->
  $(this).closest('li').remove()
