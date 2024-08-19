class AddImageToHeader < ActiveRecord::Migration[7.1]
  def change
    add_column :openings,:image,:string
  end
end
