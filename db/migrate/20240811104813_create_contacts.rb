class CreateContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :contacts do |t|
      t.string :title
      t.string :info
      t.timestamps
    end
  end
end
