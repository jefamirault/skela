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

$(function(){
    jQuery("#issue_task_id").autocomplete({
        source: function (request, response) {
            jQuery.get("/tasks/autocomplete", {
                data: request.term,
                dataType: "json"
            }, function (data) {
                response(data);
            });
        },
        autoFocus: true
    });
});

$(function(){
    jQuery("#developer_log_entry_user").autocomplete({
        source: function (request, response) {
            jQuery.get("/users/autocomplete", {
                data: request.term,
                dataType: "json"
            }, function (data) {
                response(data);
            });
        },
        autoFocus: true
    });
});
