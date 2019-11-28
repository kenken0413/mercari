console.log("1")
$(document).on('turbolinks:load', function(){
  console.log("2")
  $('.slick-box').slick({
    autoplay:true,  
    autoplaySpeed: 3000,
  });
});
