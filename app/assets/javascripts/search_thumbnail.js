// show social share menu
function showProductMenu(obj) {
  var show_menu = true;
  if ($(obj).parent().find('.social_share_group').css("visibility") == "visible")
    show_menu = false;

  $('.social_share_group').css("visibility", "hidden");

  if (show_menu)
    $(obj).parent().find('.social_share_group').css("visibility", "visible");
}

// hide social share menu
window.onclick = function(event) {
  if (!event.target.matches('.social-share')) {
    $('.social_share_group').css("visibility", "hidden");
  }
}

function copyToClipboard(text) {
    var textField = document.createElement('textarea');
    textField.innerText = text;
    document.body.appendChild(textField);
    textField.select();
    document.execCommand('copy');
    textField.remove();
}
