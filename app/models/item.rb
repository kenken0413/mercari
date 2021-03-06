class Item < ApplicationRecord
  belongs_to :category
  belongs_to :brand
  has_many :images, dependent: :destroy
  has_one :delivery, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User"
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :state
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :delivery
  accepts_nested_attributes_for :images

  validates :name,        presence: true, length: {minimum: 1,maximum: 40}
  validates :description, presence: true, length: {minimum: 1,maximum: 1000}
  validates :price,       presence: true, length: {minimum: 3,maximum: 7}
  validates :state_id,    presence: true
  validates :category_id, presence: true

end

