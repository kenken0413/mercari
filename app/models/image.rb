class Image < ApplicationRecord
  belongs_to :item
  mount_uploader :image, ImageUploader

  validates :item_id,  presence: true
  validates :image,    presence: true
end