class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :title,null: false
      t.decimal :price, null: false
      t.text :description,null: false
      t.integer :category_id

      t.timestamps
    end
    add_foreign_key :carts,:products,foreign_key: true
    add_foreign_key :carts,:users,foreign_key: true
  end
end
