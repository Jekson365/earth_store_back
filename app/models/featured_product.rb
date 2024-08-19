class FeaturedProduct < ApplicationRecord
  belongs_to :product
  validate :max_three,on: :create

  def max_three
    if FeaturedProduct.count >= 3
      errors.add(:base, 'გამოყოფილი პროდუქტები არ შეიძლება იყოს სამზე მეტი')
    end
  end
end