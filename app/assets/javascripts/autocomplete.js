$(function(){
    jQuery("#inventory_item_id").autocomplete({
        source: function (request, response) {
            jQuery.get("/items/autocomplete", {
                data: request.term,
                dataType: "json"
            }, function (data) {
                response(data);
            });
        },
        autoFocus: true

    });
});
