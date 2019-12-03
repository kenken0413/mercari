$(document).on('turbolinks:load', function(){
  $(document).ready(function(){
    $("#category-search").hover(function() {
      $('ul.category-drop-main-category').show();
    }, function(){
      $('ul.category-drop-main-category').hide();
    });
  });
});