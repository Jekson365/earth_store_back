class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.timestamps
    end
    add_foreign_key :products,:categories,foreign_key: true
  end
end
