class Category < ApplicationRecord
  has_many :products,class_name: 'Product'
  before_destroy :check_connection

  private
  def check_connection
    if products.exists?
      errors.add(:base, 'კატეგორია დაკავშირებულია პროდუქციასთან')
    end
  end
end