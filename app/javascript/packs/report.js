$(function() {
  $('.reflection').on('click', function(event) {
    $(this).parent().children('#reflection-back').fadeToggle();
    $(this).parent('#reflection-back').fadeToggle();
    event.preventDefault();
  });
});
