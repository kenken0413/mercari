Address.seed do |s|
  s.id = 1
  s.user = User.find(1)
  s.postal_code = '000-0000'
  s.prefectures = 1
  s.city = '名古屋'
  s.house = '緑区'
end

Address.seed do |s|
  s.id = 2
  s.user = User.find(2)
  s.postal_code = '000-0002'
  s.prefectures = 2
  s.city = '名古屋'
  s.house = '港区'
end

Address.seed do |s|
  s.id = 3
  s.user = User.find(3)
  s.postal_code = '000-0003'
  s.prefectures = 3
  s.city = '名古屋'
  s.house = '中川区'
end

Address.seed do |s|
  s.id = 4
  s.user = User.find(4)
  s.postal_code = '000-0000'
  s.prefectures = 4
  s.city = '名古屋'
  s.house = '天白区'
end

Address.seed do |s|
  s.id = 5
  s.user = User.find(5)
  s.postal_code = '000-0000'
  s.prefectures = 5
  s.city = '名古屋'
  s.house = '瑞穂区'
end