class AddProductIdToProdImages < ActiveRecord::Migration[7.1]
  def change
    add_reference :product_images, :product, foreign_key: true
    remove_column :product_images, :about_id, :integer
  end
end
