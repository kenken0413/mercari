class Item < ApplicationRecord
  belongs_to :category
  belongs_to :brand
  has_many :images, dependent: :destroy
  has_one :delivery, dependent: :destroy
  belongs_to :seller_id, class_name: "User"
  belongs_to :buyer_id, class_name: "User"
end
