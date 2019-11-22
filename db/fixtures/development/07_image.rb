Image.seed do |s|
  s.id = 1
  s.item = Item.find(1)
  s.image = "bag-photo.jpg"
end

Image.seed do |s|
  s.id = 2
  s.item = Item.find(2)
  s.image = "bag-brand-photo.jpg"
end

Image.seed do |s|
  s.id = 3
  s.item = Item.find(3)
  s.image = "sample1.jpg"
end

Image.seed do |s|
  s.id = 4
  s.item = Item.find(4)
  s.image = "men's cloth.jpg"
end

Image.seed do |s|
  s.id = 5
  s.item = Item.find(5)
  s.image = "pikachu.jpg"
end