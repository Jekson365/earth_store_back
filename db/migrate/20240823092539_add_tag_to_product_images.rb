class AddTagToProductImages < ActiveRecord::Migration[7.1]
  def change
    add_column :product_images,:main,:boolean,default: false
  end
end
