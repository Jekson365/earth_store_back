class CreatePostcards < ActiveRecord::Migration[7.1]
  def change
    create_table :postcards do |t|
      t.string :title
      t.string :min_title

      t.timestamps
    end
  end
end
