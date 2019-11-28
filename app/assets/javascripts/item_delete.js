$(document).on('turbolinks:load',function(){
  $('#item-delete').on('click', function(){
    confirm("この商品を削除しますか？")
  });
});