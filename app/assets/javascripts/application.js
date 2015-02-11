// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

function doc_keyUp(e) {
    if (e.shiftKey && e.keyCode == 40) {
        $('.developer_pad').toggleClass('hidden');
    } else if (e.keyCode == 32) {
        hideFlash();
    }
}
document.addEventListener('keyup', doc_keyUp, false);

function hideFlash() {
    if ($('input:focus').size() == 0)
        $('.flash').addClass('hidden');
}

$(document).on('click', '#trigger_flash_notice', function(event) {
    $('.flash.notice').html('hahahahahaha');
    $('.flash.notice').toggleClass('hidden');
    event.preventDefault();
});
$(document).on('click', '#trigger_flash_alert', function(event) {
    $('.flash.alert').html('hahahahahaha');
    $('.flash.alert').toggleClass('hidden');
    event.preventDefault();
});

$(document).on('click', '#hide_stuff', function(event) {
    $('#user_form').toggleClass('hidden');
    event.preventDefault();
});
