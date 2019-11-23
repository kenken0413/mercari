Delivery.seed do |s|
  s.id = 1
  s.item = Item.find(1)
  s.postage_method_id = 1
  s.postage_detail_id = 1
  s.prefecture_id = 2
  s.shipping_date_id = 1
end

Delivery.seed do |s|
  s.id = 2
  s.item = Item.find(2)
  s.postage_method_id = 2
  s.postage_detail_id = 2
  s.prefecture_id = 3
  s.shipping_date_id = 2
end

Delivery.seed do |s|
  s.id = 3
  s.item = Item.find(3)
  s.postage_method_id = 3
  s.postage_detail_id = 3
  s.prefecture_id = 4
  s.shipping_date_id = 3
end