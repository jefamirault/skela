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
//= require dataTables/jquery.dataTables
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
function flashNotice(message) {
    if (message == '')
        return false;
    $('.flash.notice').html(message);
    $('.flash.alert').html('');
    $('.flash.notice').removeClass('hidden');
    window.setTimeout(function(){
        $('.flash.notice').addClass('hidden');
    }, 1800);
}
function flashAlert(message) {
    if (message == '')
        return false;
    $('.flash.alert').html(message);
    $('.flash.notice').html('');
    $('.flash.alert').removeClass('hidden');
    window.setTimeout(function(){
        $('.flash.alert').addClass('hidden');
    }, 1800);
}

$(document).on('click', '#trigger_flash_notice', function(event) {
    //$('.flash.notice').html('hahahahahaha');
    $('.flash.notice').toggleClass('hidden');
    event.preventDefault();
});
$(document).on('click', '#trigger_flash_alert', function(event) {
    //$('.flash.alert').html('hahahahahaha');
    $('.flash.alert').toggleClass('hidden');
    event.preventDefault();
});

$(document).on('click', '#hide_stuff', function(event) {
    $('#user_form').toggleClass('hidden');
    event.preventDefault();
});

function hide(selector) {
    jQuery(selector).addClass('hidden');
}
function show(selector) {
    jQuery(selector).removeClass('hidden');
}

$(document).on('click', '.destroy_issue', function(){
    var row = $(this).closest('tr');
    row.addClass('invisible');
    window.setTimeout(function(){
        row.addClass('hidden');
    }, 450);
});
