class CreateAdditionalDescriptions < ActiveRecord::Migration[7.1]
  def change
    create_table :additional_descriptions do |t|
      t.string :title
      t.timestamps
    end
  end
end
