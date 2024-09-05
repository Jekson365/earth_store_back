module Products
  class ProductBlueprint < Blueprinter::Base
    view :show do
      association :product_images,blueprint: ProductImagesBlueprint
      association :category,blueprint: Categories::CategoriesBlueprint,view: :normal
      fields :title,:price,:description,:id,:sale_price,:amount
    end
  end
end