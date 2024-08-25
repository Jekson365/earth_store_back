class Opening < ApplicationRecord
  has_many :opening_images,dependent: :destroy
  accepts_nested_attributes_for :opening_images
end
