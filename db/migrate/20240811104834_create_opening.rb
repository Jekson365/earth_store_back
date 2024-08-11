class CreateOpening < ActiveRecord::Migration[7.1]
  def change
    create_table :openings do |t|
      t.string :title
      t.string :min_title
      t.timestamps
    end
  end
end
