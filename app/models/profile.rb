class Profile < ApplicationRecord
  belongs_to :user

  validates :family_name_zen,      presence: true, length: {maximum: 35}
  validates :first_name_zen,       presence: true, length: {maximum: 35}
  validates :family_name_kana,     presence: true, length: {maximum: 35}
  validates :first_name_kana,      presence: true, length: {maximum: 35}
  validates :birthday,             presence: true
end