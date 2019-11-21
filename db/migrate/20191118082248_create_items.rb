class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name, null: false, index: true
      t.text :description, null: false
      t.integer :price, null:false, index: true
      t.integer :state, null: false
      t.integer :seller_id, null: false, foreign_key: true
      t.integer :buyer_id, foreign_key: true
      t.integer :category_id, null: false, foreign_key: true
      t.integer :brand_id, foreign_key: true
      t.timestamps
    end
  end
end
