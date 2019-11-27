class RemoveExpirationDateFromCredits < ActiveRecord::Migration[5.0]
  def change
    remove_column :credits, :expiration_date, :date
    remove_column :credits, :card_num, :integer
    remove_column :credits, :security_code, :integer
  end
end
