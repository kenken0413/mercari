$(document).on('turbolinks:load', function(){
  // 変数定義
  var images = [];
  var inputs = [];
  var form_image = $('.form_image');
  var dropbox = $('.dropbox');
  var preview = $('#preview');
  const THUMBNAIL_WIDTH = 112;
  const THUMBNAIL_HEIGHT = 112;

//   // fileが変更された時のイベント
  $(document).on('change', 'input[type= file].upload-image',function(event) {
    var file = $(this).prop('files')[0];
    var reader = new FileReader();
    inputs.push($(this));
    var img = $(`<div class= "img_view" width="0" height="0"><img></div>`);
    reader.onload = function(e) {
      var btn_wrapper = $('<div class="btn_wrapper"><div class="btn edit">編集</div><div class="btn delete">削除</div></div>');
      img.append(btn_wrapper);
      img.find('img').attr({ src: e.target.result })
    };
    reader.readAsDataURL(file);
    images.push(img);
      $.each(images, function(i, image) {
        image.attr('data-image', i);
        preview.append(image);
        console.log(preview)
        // dropbox.css({ 'width': `calc(100% - (135px * ${images.length - 5}))` })
      });
    var new_image = $(`<input multiple= "multiple" name="images[image][]" class="upload-image" data-image= ${images.length} type="file" id="upload-image">`);
    form_image.prepend(new_image);
    if (images.length == 10) {
      dropbox.css({
        display: "none"
      });
    }
  });
  $(document).on('click', '.delete', function() {
    var target_image = $(this).parent().parent();
    $.each(inputs, function(index, input){
      if ($(this).data('image') == target_image.data('image')){
        $(this).remove();
        target_image.remove();
        var num = $(this).data('image');
        images.splice(num, 1);
        inputs.splice(num, 1);
        if(inputs.length == 0) {
          $('input[type= "file"].upload-image').attr({ 'data-image': 0 })
        }
      }
    });

  });

});