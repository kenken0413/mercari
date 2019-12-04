class Delivery < ApplicationRecord
  belongs_to :item
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :postage_method
  belongs_to_active_hash :postage_detail
  belongs_to_active_hash :shipping_date
  belongs_to_active_hash :prefecture

  validates :postage_method_id, presence: true
  validates :postage_detail_id, presence: true
  validates :prefecture_id,     presence: true
  validates :shipping_date_id,  presence: true

end
