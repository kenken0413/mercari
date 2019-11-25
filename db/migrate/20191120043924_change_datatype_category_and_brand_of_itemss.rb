class ChangeDatatypeCategoryAndBrandOfItemss < ActiveRecord::Migration[5.0]
  def change
    # [形式] change_column(テーブル名, カラム名, データタイプ, オプション)
    change_column :items, :seller_id, :integer, null: false, foreign_key: true
    change_column :items, :buyer_id, :integer, foreign_key: true
  end
end
