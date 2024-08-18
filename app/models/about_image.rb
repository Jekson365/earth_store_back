class AboutImage < ApplicationRecord
  belongs_to :about
  mount_uploader :image,AboutImageUploader
end