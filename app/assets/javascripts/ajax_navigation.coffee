$(document).on 'click', '#issues_index_link', ->
  $('#header_right nav').closest('nav').find('a:not(#issues_index_link)').removeClass('selected');
  $('#issues_index_link').addClass 'selected'
  hide('#container')
