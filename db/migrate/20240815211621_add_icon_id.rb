class AddIconId < ActiveRecord::Migration[7.1]
  def change
    add_column :priors,:icon_id,:integer
  end
end
