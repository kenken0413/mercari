class Address < ApplicationRecord
  belongs_to :user, optional: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  delegate :name, to: :prefecture

  POSTAL_CODE_VALIDATION = /\A\d{7}\z/
  validates :postal_code,       presence: true, length: {maximum: 35}, format: { with: POSTAL_CODE_VALIDATION }
  validates :prefecture_id,     presence: true, length: {maximum: 35}
  validates :city,              presence: true, length: {maximum: 35}
  validates :house,             presence: true, length: {maximum: 35}
end
