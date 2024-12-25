class AddNameToSettings < ActiveRecord::Migration[7.1]
  def change
    add_column :settings,:name,:string
  end
end
