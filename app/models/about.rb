class About < ApplicationRecord
  has_one :about_image,dependent: :destroy
  accepts_nested_attributes_for :about_image,allow_destroy: true
end
