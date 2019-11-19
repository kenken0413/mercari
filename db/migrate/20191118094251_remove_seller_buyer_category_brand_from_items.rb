class RemoveSellerBuyerCategoryBrandFromItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :seller_id
    remove_column :items, :buyer_id
    remove_column :items, :category
    remove_column :items, :brand
  end
end
