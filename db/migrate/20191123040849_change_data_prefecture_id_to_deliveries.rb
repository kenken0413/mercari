class ChangeDataPrefectureIdToDeliveries < ActiveRecord::Migration[5.0]
  def change
    change_column :deliveries, :prefecture_id, :integer
  end
end
