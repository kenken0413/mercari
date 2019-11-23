class Profile < ApplicationRecord
  belongs_to :user

  validates :family_name_zen,      presence: true, length: {maximum: 35}, on: :save_n1_to_session
  validates :first_name_zen,       presence: true, length: {maximum: 35}, on: :save_n1_to_session
  validates :family_name_kana,     presence: true, length: {maximum: 35}, on: :save_n1_to_session
  validates :first_name_kana,      presence: true, length: {maximum: 35}, on: :save_n1_to_session
  validates :birthday,             presence: true, on: :save_n1_to_session
end