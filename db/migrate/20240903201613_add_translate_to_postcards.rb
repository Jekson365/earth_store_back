class AddTranslateToPostcards < ActiveRecord::Migration[7.1]
  def change
    add_column :postcards,:title_ka,:string
    add_column :postcards,:min_title_ka,:string
  end
end
