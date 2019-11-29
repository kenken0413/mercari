$(document).on('turbolinks:load',function(){
  // セレクトボックスの中身
  function select_box(category){
    var html = `<option value="${category.id}" data-category="${category.id}">${category.category}</option>`;
    return html
  }

  // 子カテゴリ差し込み
  function child_box(insertHTML){
    var childHTML = '';
    childHTML     = `<div class='sell-main-form__content__detail__category__box' id= 'insert-child'>
                      <select class="sell-main-form__content__detail__category__box__child" id="child_category" >
                        <option value="---" data-category="---">---</option>
                        ${insertHTML}
                      </select>
                      <i class='fas fa-chevron-down chevron'></i>
                    </div>`;
    $('.sell-main-form__content__detail__category').append(childHTML);
  }
  // 孫カテゴリ差し込み
  function grandchild_box(insertHTML){
    var grandchildHTML = '';
    grandchildHTML     = `<div class='sell-main-form__content__detail__category__box' id= 'insert-grandchild'>
                      <select class="sell-main-form__content__detail__category__box__grandchild" id="grandchild_category" >
                        <option value="---" data-category="---">---</option>
                        ${insertHTML}
                      </select>
                      <i class='fas fa-chevron-down chevron'></i>
                    </div>`;
    $('.sell-main-form__content__detail__category').append(grandchildHTML);
  }
  // 子　発火
  $('#parent_category').on('change',function(){
    // 選択した値を取得
    var parent = document.getElementById('parent_category').value;
    if (parent != ""){ 
      $.ajax({
        url: 'category_children',
        type: 'GET',
        data: { parent_id: parent },
        dataType: 'json',
      })
      .done(function(children){
        $('#insert-child').remove(); 
        $('#insert-grandchild').remove();
        $('#insert-brand').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += select_box(child);
        });
        child_box(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#insert-child').remove(); 
      $('#insert-grandchild').remove();
      $('#insert-brand').remove();
    }
  });

  // 孫　発火
  $('.sell-main-form__content__detail__category').on('change', '#child_category', function(){
    var childId = $('#child_category option:selected').data('category');
    if (childId != "---"){
      $.ajax({
        url: 'category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grand){
        if (grand.length != 0) {
          $('#insert-grandchild').remove();
          $('#insert-brand').remove();
          var insertHTML = '';
          grand.forEach(function(grand){
            insertHTML += select_box(grand);
          });
          grandchild_box(insertHTML);
          $('#child_category').attr('name','item[category_id]');
          $('.sell-main-form__content__detail__brand').remove('.hidden')
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#insert-grandchild').remove();
      $('#insert-brand').remove();
    }
  });

  $('.sell-main-form__content__detail__category').on('change', '#grandchild_category', function(){
    if (childId != "---"){
    $('#grandchild_category').attr('name','item[category_id]');
    }else{ ; }
  });
});
