class Postcard < ApplicationRecord
  mount_uploader :image,PostcardUploader
end
