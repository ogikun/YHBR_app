$(function() {
  $('.reflection').on('click', function(event) {
    $('#reflection-back').fadeToggle();
    event.preventDefault();
  });
});