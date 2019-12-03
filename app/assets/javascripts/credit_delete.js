$(document).on('turbolinks:load',function(){
  $('#credit-delete').on('click', function(){
    if( confirm("このカードを削除しますか？") ){
      alert("削除しました")
    } else {
      return false;
    }
  });
});