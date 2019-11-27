// $(function(){
//   function uploadImage(img){
//     var html =  ` <li class = "image-preview" >
//                     <img src = "${img.url}"  id: "prev" class: "image-preview__upper">
//                     </img>
//                     <div class = "image-preview__lower">
//                       <div class = "image-preview__lower__btn"> 編集
//                       </div>
//                       <div class = "image-preview__lower__btn edit"> 削除
//                       </div>
//                     </div>
//                   </li> `
// return html;
//   };

//   // ファイルを変更したら発火
//   $('#post_img').change(function(){

//   // 入力されたファイルの情報取得
//     var file = this.files[0];

//     // 画像でなければ処理終了
//     if(file.type.indexOf("image") < 0){
//       alert("画像ファイルを指定してください。");
//       return false;
//     }
//     var html = uploadImage(file);
//     $('.image-preview-list').append(html);
//   });
// });

// 手数料・利益自動計算
$(function(){
  $('#calc').on('input', function(){
    var data = $('#calc').val() ;
    // 値を取得
    $('#price').val(data) ; 
    // 入力対象と非対称で分岐
    if ( 299 < data && data < 10000000 ) {
      // 手数料と利益を計算で算出
      var fee = Math.round( data * 0.1) ;
      var profit = ( data - fee ) ;
      // カンマ処理
      fee = String(fee).replace(/(\d)(?=(\d\d\d)+$)/g, '$1,'); 
      profit = String(profit).replace(/(\d)(?=(\d\d\d)+$)/g, '$1,');
      // 値を書き換える　＋　￥マークつける
      $('#fee').html(fee) 
      $('#fee').prepend('¥') 
      $('#profit').html(profit) 
      $('#profit').prepend('¥') 
    }else{
      // 入力範囲外で値を'-'に変える
      $('#fee').html('-');
      $('#profit').html('-');
    }
  });
});