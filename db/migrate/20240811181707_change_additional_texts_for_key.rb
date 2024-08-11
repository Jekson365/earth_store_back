class ChangeAdditionalTextsForKey < ActiveRecord::Migration[7.1]
  def change
    remove_column :additional_descriptions,:additional_text_id
    add_reference :additional_texts,:additional_description,foreign_key: true
  end
end
