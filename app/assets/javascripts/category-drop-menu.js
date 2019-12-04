$(document).on('turbolinks:load', function(){
  $("#category-search").hover(function() {
    $('.category-drop-parent_list').show();
  }, function(){
    $('.category-drop-parent_list').hide();

  })
  function buildChildHTML(child){
    var html =`<a class="category-drop-child_category" id="${child.id}" 
                >
              ${child.category}
              </a>`;
    return html;
  }

  $(".category-drop-parent_category").on("mouseover", function() {
    var id = this.id
    $(".category-drop-child_category").remove();
    $(".category-drop-grandchild_category").remove();

    $.ajax({
      type: 'GET',
      url: '/category/new',//とりあえずここでは、newアクションに飛ばしてます
      data: {parent_id: id},//どの親の要素かを送ります　params[:parent_id]で送られる
      dataType: 'json'
    }).done(function(children) {
      children.forEach(function (child) {//帰ってきた子カテゴリー（配列）
        var html = buildChildHTML(child);//HTMLにして
        $(".category-drop-child_list").append(html);
      })
      $(document).on("mouseout", ".category-drop-parent_category", function () {
          $(".category-drop-child_category").remove();
        });
    });
  });

  // 孫カテゴリを追加する処理
  function buildGrandChildHTML(child){
    var html =`<a class="category-drop-grandchild_category" id="${child.id}"
              >
              ${child.category}
              </a>`;
    return html;
  }

  $(document).on("mouseover", ".category-drop-child_category", function () {
    var id = this.id
    $.ajax({
      type: 'GET',
      url: '/category/new',
      data: {parent_id: id},
      dataType: 'json'
    }).done(function(children) {

      children.forEach(function (child) {
        var html = buildGrandChildHTML(child);
        $(".category-drop-grandchild_list").append(html);
      })
      $(document).on("mouseover", ".category-drop-child_category", function () {
        $(".category-drop-grandchild_category").remove();
      });
      $(document).on("mouseover", ".category-drop-parent_category", function () {
        $(".category-drop-grandchild_category").remove();
      });
      $(document).on("mouseout", ".category-drop-grandchild_category", function () {
        $(".category-drop-grandchild_category").remove();
        $(".category-drop-child_category").remove();
      });
      
    });
  });  
});