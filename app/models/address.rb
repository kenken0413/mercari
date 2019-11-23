class Address < ApplicationRecord
  belongs_to :user, optional: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  delegate :name, to: :prefecture

  validates :postal_code,       presence: true, length: {maximum: 35}, on: :save_n3_to_session
  validates :prefectures,       presence: true, length: {maximum: 35}, on: :save_n3_to_session
  validates :city,              presence: true, length: {maximum: 35}, on: :save_n3_to_session
  validates :house,             presence: true, length: {maximum: 35}, on: :save_n3_to_session
end
