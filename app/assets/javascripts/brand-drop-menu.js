$(document).on('turbolinks:load', function(){
  $(document).ready(function(){
    $("#brand-search").hover(function() {
      $('ul.brand-drop-main-category').show();
    }, function(){
      $('ul.brand-drop-main-category').hide();
    });
  });
});