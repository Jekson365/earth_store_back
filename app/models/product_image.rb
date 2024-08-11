class ProductImage < ApplicationRecord
  mount_uploader :image,ProductImageUploader
end