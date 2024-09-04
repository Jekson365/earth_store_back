class AddTranslationToCategories < ActiveRecord::Migration[7.1]
  def change
    add_column :categories,:name_ka,:string
  end
end
