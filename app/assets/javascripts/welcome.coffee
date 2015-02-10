$(document).on 'submit', '#center_form_box form', ->
  $('#login_button').val 'Logging in...'
  $(this).find('.center_form_field input').addClass 'disabled'
  $('.flash').addClass 'hidden'
