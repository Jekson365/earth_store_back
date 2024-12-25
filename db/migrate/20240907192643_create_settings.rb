class CreateSettings < ActiveRecord::Migration[7.1]
  def change
    create_table :settings do |t|
      t.string :param_name
      t.boolean :status
    end
  end
end
