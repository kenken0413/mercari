crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", users_path
  parent :root
end

crumb :card do
  link "支払い方法", card_index_users_path
  parent :mypage
end

crumb :card_registration do
  link "クレジットカード情報入力", card_registrations_users_path
  parent :card
end

# crumb :profile do
#   link "プロフィール", profile_users_path
#   parent :mypage
# end

crumb :identification do
  link "本人情報の登録", identification_users_path
  parent :mypage
end

crumb :logout do
  link "ログアウト", logout_users_path
  parent :mypage
end

# crumb :exhibition do
#   link "出品した商品-出品中", exhibition_users_path
#   parent :mypage
# end

# crumb :trading do
#   link "出品した商品-取引中", trading_users_path
#   parent :mypage
# end

# crumb :sold do
#   link "出品した商品-売却済み", sold_users_path
#   parent :mypage
# end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).