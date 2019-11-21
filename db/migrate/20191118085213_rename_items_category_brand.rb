class RenameItemsCategoryBrand < ActiveRecord::Migration[5.0]
  def change
    rename_column :items, :category_id, :category
    rename_column :items, :brand_id, :brand
  end
end
