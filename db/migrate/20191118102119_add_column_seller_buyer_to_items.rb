class AddColumnSellerBuyerToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :seller_id, :string, null: false, foreign_key: true
    add_column :items, :buyer_id, :string, foreign_key: true
  end
end
