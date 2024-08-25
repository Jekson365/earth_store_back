class Product < ApplicationRecord
  belongs_to :category,class_name: 'Category'
  has_many :product_images,dependent: :destroy
  has_many :carts,dependent: :destroy
  has_many :featured_products,dependent: :destroy
  # has_many :featured_products
  accepts_nested_attributes_for :product_images,allow_destroy: true
end