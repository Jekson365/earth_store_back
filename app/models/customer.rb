class Customer < ApplicationRecord
  validate :max_three,on: :create


  private
  def max_three
    if Customer.count >= 3
      errors.add(:base,'მასქიმუმ სამი რივიუ')
    end
  end
end
