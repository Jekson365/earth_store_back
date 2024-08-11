class CreateAdditionalTexts < ActiveRecord::Migration[7.1]
  def change
    create_table :additional_texts do |t|
      t.string :description
      t.timestamps
    end
    add_column :additional_descriptions,:additional_text_id,:integer
    add_foreign_key :additional_descriptions,:additional_texts,foreign_key: true
  end
end
