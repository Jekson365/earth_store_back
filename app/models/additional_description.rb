class AdditionalDescription < ApplicationRecord
  has_many :additional_texts
  accepts_nested_attributes_for :additional_texts
end
