class Item < ApplicationRecord
  belongs_to :category
  belongs_to :brand
  has_many :images, dependent: :destroy
  has_one :delivery, dependent: :destroy
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User"
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :state
end

