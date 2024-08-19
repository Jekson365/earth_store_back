class CreateFeaturedProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :featured_products do |t|
      t.timestamps
    end
    add_reference :featured_products,:product,foreign_key: true
  end
end
