class CreateCredits < ActiveRecord::Migration[5.0]
  def change
    create_table :credits do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :card_num, null: false, unique: true
      t.date :expiration_date, null:false
      t.integer :security_code, null: false
      t.timestamps
    end
  end
end
