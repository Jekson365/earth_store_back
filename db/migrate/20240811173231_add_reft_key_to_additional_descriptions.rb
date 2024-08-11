class AddReftKeyToAdditionalDescriptions < ActiveRecord::Migration[7.1]
  def change
    remove_column :additional_descriptions,:product_id
    add_reference :additional_descriptions,:product,foreign_key: true
  end
end
