class Delivery < ApplicationRecord
  belongs_to :item
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :postage_method
  belongs_to_active_hash :postage_detail
  belongs_to_active_hash :shipping_date
  belongs_to_active_hash :prefecture
end
