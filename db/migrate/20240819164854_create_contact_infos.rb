class CreateContactInfos < ActiveRecord::Migration[7.1]
  def change
    create_table :contact_infos do |t|
      t.string :email
      t.string :phone_number
      t.string :location
      t.timestamps
    end
  end
end
