class AddReftKeyToAdditionalDescriptions < ActiveRecord::Migration[7.1]
  def change
    add_reference :additional_descriptions,:product,foreign_key: true
  end
end
