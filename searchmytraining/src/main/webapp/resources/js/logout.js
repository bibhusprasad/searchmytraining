$(function logout() {

      $('#menu_opener').click(function() {
  $('#submenu').slideToggle('fast');
  return false;

});
  });

$(document).click(function() {
$('#submenu').slideUp('');
});

$("#submenu").click(function(e) {
e.stopPropagation(); });
