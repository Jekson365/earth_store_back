class AddImageToPostcard < ActiveRecord::Migration[7.1]
  def change
    add_column :postcards,:image,:string
  end
end
