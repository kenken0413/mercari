Item.seed do |s|
  s.id = 1
  s.name = "カバン白"
  s.description = "いい商品です。"
  s.price = 12000
  s.state = 1
  s.seller = User.find(1)
  s.buyer = User.find(2)
  s.category = Category.find(96)
  s.brand = Brand.find(2006)
end

Item.seed do |s|
  s.id = 2
  s.name = "カバンベージュ"
  s.description = "売れてる商品です。"
  s.price = 18000
  s.state = 2
  s.seller = User.find(1)
  s.category = Category.find(96)
  s.brand = Brand.find(4721)
end

Item.seed do |s|
  s.id = 3
  s.name = "ゴルフクラブ"
  s.description = "よく飛びます。"
  s.price = 50000
  s.state = 3
  s.seller = User.find(4)
  s.buyer = User.find(5)
  s.category = Category.find(985)
  s.brand = Brand.find(167)
end

Item.seed do |s|
  s.id = 4
  s.name = "メンズジャージ"
  s.description = "快適です。"
  s.price = 7000
  s.state = 4
  s.seller = User.find(1)
  s.category = Category.find(211)
end

Item.seed do |s|
  s.id = 5
  s.name = "ポケモンカード"
  s.description = "珍しいカードです。"
  s.price = 800
  s.state = 5
  s.seller = User.find(1)
  s.buyer = User.find(3)
  s.category = Category.find(707)
end