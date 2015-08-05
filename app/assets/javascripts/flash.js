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
