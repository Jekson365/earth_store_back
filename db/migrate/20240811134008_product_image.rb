class ProductImage < ActiveRecord::Migration[7.1]
  def change
    create_table :product_images do |t|
      t.references :product,null: false,foreign_key: true
      t.string :image

    end
  end
end
