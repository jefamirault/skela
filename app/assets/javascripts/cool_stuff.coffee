$(document).on 'click', '.trigger_reveal', ->
  $(this).hide();
  $(this).parent().find('.to_be_revealed').show();
  $(this).parent().find('.to_be_revealed .reveal_focus').focus();
