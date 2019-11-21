class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :postal_code, null: false
      t.integer :prefectures, null:false
      t.string :city, null: false
      t.string :house, null: false
      t.string :building
      t.string :telephone
      t.timestamps
    end
  end
end
