class CreateAboutImages < ActiveRecord::Migration[7.1]
  def change
    create_table :about_images do |t|
      t.string :image,null: false
    end
    add_reference :about_images,:about,foreign_key: true
  end
end
