class CreateDeliveries < ActiveRecord::Migration[5.0]
  def change
    create_table :deliveries do |t|
      t.references :item, null: false, foreign_key: true
      t.integer :postage_method, null: false
      t.integer :postage_detail, null:false
      t.string :region, null: false
      t.integer :shipping_date, null: false
      t.timestamps
    end
  end
end
