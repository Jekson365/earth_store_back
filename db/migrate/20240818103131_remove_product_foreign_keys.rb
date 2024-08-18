class RemoveProductForeignKeys < ActiveRecord::Migration[7.1]
  def change
    remove_column :abouts,:product_id
    remove_column :abouts,:products_id
  end
end
