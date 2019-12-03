$(document).on('turbolinks:load',function(){
  $('#item-delete').on('click', function(){
    if( confirm("この商品を削除しますか？") ){
      alert("削除しました")
    } else {
      alert("キャンセルされました")
      return false;
    }
  });
});