$(function(){
  function uploadImage(img){
    var html =  ` <li class = "image-preview" >
                    ${img}
                    <div class = "image-preview__lower">
                      <div class = "image-preview__lower__btn"> 編集
                      </div>
                      <div class = "image-preview__lower__btn edit"> 削除
                      </div>
                    </div>
                  </li> `
    return html;
  };

  // ファイルを変更したら発火
  $('#image_image').change(function(img){

    // 画像のデータを取得。ここでconsole.logをすると画像が取得できている
		var file = $(this).prop('files')[0];



    if (! file.type.match('image.*')) {
			$(this).val('');
			$('#image_image').html('');
			return;
		}
    // FileReaderを使用する記述。console.logで空のFileReaderが確認された
    var file = document.getElementById('fileItem').files[0];
    console.log(reader)

    // ここ以降の記述がおかしいと思われる。２行目のvar srcの値をconsole.logで確認しても表示されない。
    reader.onload = function (e) {

     var src = reader.result;

     console.log(src);

    };

      // var html = uploadImage(img_src);

      // $('.image-preview-list').append(html);
 
 
  });
});