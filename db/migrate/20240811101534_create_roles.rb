class CreateRoles < ActiveRecord::Migration[7.1]
  def up
    create_table :roles do |t|
      t.string :name

      t.timestamps
    end
  end
end
