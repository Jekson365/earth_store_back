class Product < ApplicationRecord
  belongs_to :category,class_name: 'Category'
  has_many :product_images,dependent: :destroy
  belongs_to :cart
  # has_many :featured_products
  accepts_nested_attributes_for :product_images,allow_destroy: true
end