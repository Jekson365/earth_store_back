class Product < ApplicationRecord
  belongs_to :category,class_name: 'Category'
  has_many :product_images,dependent: :destroy
  accepts_nested_attributes_for :product_images,allow_destroy: true
end