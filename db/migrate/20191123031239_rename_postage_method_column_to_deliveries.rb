class RenamePostageMethodColumnToDeliveries < ActiveRecord::Migration[5.0]
  def change
    rename_column :deliveries, :postage_method, :postage_method_id
  end
end
