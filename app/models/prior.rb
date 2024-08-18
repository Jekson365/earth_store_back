class Prior < ApplicationRecord
  validate :max_three, on: :create

  private

  def max_three
    if Prior.count >= 3
      errors.add(:base, 'პრიორიტეტი არ შეიძლება იყოს სამზე მეტი')
    end
  end
end
