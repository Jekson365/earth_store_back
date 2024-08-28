class CreateShopSlider < ActiveRecord::Migration[7.1]
  def change
    create_table :shop_sliders do |t|
      t.string :header
      t.string :image
    end
  end
end
