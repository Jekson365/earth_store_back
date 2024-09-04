class AddTranslatedColumnsToOpenings < ActiveRecord::Migration[7.1]
  def change
    add_column :openings,:title_ka,:string
    add_column :openings,:min_title_ka,:string
  end
end
