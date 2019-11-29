class Address < ApplicationRecord
  belongs_to :user, optional: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  delegate :name, to: :prefecture

  validates :postal_code,       presence: true, length: {minimum: 7,maximum: 7}
  validates :prefecture_id,     presence: true
  validates :city,              presence: true, length: {maximum: 35}
  validates :house,             presence: true, length: {maximum: 35}
end
