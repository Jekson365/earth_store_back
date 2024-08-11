class CreateSocials < ActiveRecord::Migration[7.1]
  def change
    create_table :socials do |t|
      t.string :title
      t.string :social_link
      t.timestamps
    end
  end
end
