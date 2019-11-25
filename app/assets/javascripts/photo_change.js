$(document).on("mouseover", '#selected-image', function(){
  var url = $(this).attr('src');
  $('#big-image').attr('src', url)
});
