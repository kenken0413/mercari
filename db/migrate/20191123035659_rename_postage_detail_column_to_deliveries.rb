class RenamePostageDetailColumnToDeliveries < ActiveRecord::Migration[5.0]
  def change
    rename_column :deliveries, :postage_detail, :postage_detail_id
    rename_column :deliveries, :region, :prefecture_id
    rename_column :deliveries, :shipping_date, :shipping_date_id
  end
end
