class CreateOpeningImages < ActiveRecord::Migration[7.1]
  def change
    create_table :opening_images do |t|
      t.string :image
      t.timestamps
    end
    add_reference :opening_images,:opening,foreign_key: true
  end
end
