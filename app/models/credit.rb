class Credit < ApplicationRecord
  belongs_to :user, optional: true

  validates :postal_code,       presence: true, length: {maximum: 35}, on: :save_n4_to_session
  validates :prefectures,       presence: true, length: {maximum: 35}, on: :save_n4_to_session
  validates :city,              presence: true, length: {maximum: 35}, on: :save_n4_to_session
  validates :house,             presence: true, length: {maximum: 35}, on: :save_n4_to_session
end
