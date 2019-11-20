Profile.seed do |s|
  s.id = 1
  s.user = User.find(1)
  s.family_name_zen = '苗字'
  s.first_name_zen = '名前'
  s.family_name_kana = 'ミョウジ'
  s.first_name_kana = 'ナマエ'
  s.birthday = '2000-01-01'
end

Profile.seed do |s|
  s.id = 2
  s.user = User.find(2)
  s.family_name_zen = '佐藤'
  s.first_name_zen = '太郎'
  s.family_name_kana = 'サトウ'
  s.first_name_kana = 'タロウ'
  s.birthday = '2000-01-02'
end

Profile.seed do |s|
  s.id = 3
  s.user = User.find(3)
  s.family_name_zen = '鈴木'
  s.first_name_zen = '次郎'
  s.family_name_kana = 'スズキ'
  s.first_name_kana = 'ジロウ'
  s.birthday = '2000-01-03'
end

Profile.seed do |s|
  s.id = 4
  s.user = User.find(4)
  s.family_name_zen = '田中'
  s.first_name_zen = '花子'
  s.family_name_kana = 'タナカ'
  s.first_name_kana = '花子'
  s.birthday = '2000-01-04'
end

Profile.seed do |s|
  s.id = 5
  s.user = User.find(5)
  s.family_name_zen = 'てすと'
  s.first_name_zen = 'うけぞう'
  s.family_name_kana = 'テスト'
  s.first_name_kana = 'ウケゾウ'
  s.birthday = '2000-01-05'
end