module Products
  class ProductBlueprint < Blueprinter::Base
    view :show do
      association :product_images,blueprint: ProductImagesBlueprint
      association :category,blueprint: Categories::CategoriesBlueprint
      fields :title,:price,:description
    end
  end
end