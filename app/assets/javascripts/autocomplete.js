function registerAutocomplete(selector, controller) {
  $(selector).autocomplete({
    source: function(request, response) {
      $.get("/" + controller + "/autocomplete", {
        data: request.term,
        dataType: "json"
      }, function (data) {
        response(data);
      });
    },
    autoFocus: true
  });
}

$(document).on('keydown', '[data-autocomplete]', function(){
  registerAutocomplete(this, $(this).data('autocomplete'));
});
