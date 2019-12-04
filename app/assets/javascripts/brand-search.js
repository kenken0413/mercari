$(function() {
  // 定義と差し込みリストの式
  var brand_list = $(".search-brand-list") 
  var brand_input = $(".brand-search")
  function brandItem(brand){
    var html =  `<li class = "li-item", id = ${brand.id}, value = ${brand.id} > ${brand.brand} </li>`
    brand_list.append(html);
  }

  // ブランドフォームに入力した時にインクリメンタルサーチを行う
  $(brand_input).on("keyup", function() {
    var input = $(brand_input).val();
    $.ajax({
      type: 'GET',
      url: '/brands/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(brands) {
    $(brand_list).empty();
      if (brands.length !== 0 ) {
        brands.forEach(function(brand){
          brandItem(brand);
        });
      }
      else {
        $('.li-item').remove();
       }
    })
    .fail(function() {
      alert('ブランド検索できませんでした');
    })
  });

  $('.search-brand-list').on("click", ".li-item", function() {
    select = $(this).attr('value');
    brandName = $(this).attr('text');
    brand_input.val(select);
    $('.li-item').remove();
  });


});