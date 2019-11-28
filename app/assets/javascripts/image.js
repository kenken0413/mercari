$(function() {
  var uploadImage =  ` <li class = "image-preview" >
                         <div class = "image-preview__upper">
                         <div class = "image-preview__lower">
                           <div class = "image-preview__lower__btn"> 編集
                           </div>
                           <div class = "image-preview__lower__btn edit"> 削除
                           </div>
                         </div>
                       </li> `

  $('input[type=file]').change(function() {
    $('.image-preview-list').append(uploadImage)

    var file = $(this).prop('files')[0];
    // 画像以外は処理を停止
    if (! file.type.match('image.*')) {
      // クリア
      $(this).val('');
      return;
    }

    // 画像表示
    var reader = new FileReader();
    reader.onload = function() {
      var img_src = $('<img>').attr('src', reader.result);
      $('.image-preview__upper').html(img_src);
    }
    // ('.image-preview-wrapper').append(html)
    reader.readAsDataURL(file);
  });
});
