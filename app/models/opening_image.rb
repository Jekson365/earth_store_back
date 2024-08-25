class OpeningImage < ApplicationRecord
  mount_uploader :image, OpeningImageUploader

  belongs_to :opening
end