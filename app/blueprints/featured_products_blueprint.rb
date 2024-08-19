class FeaturedProductsBlueprint < Blueprinter::Base
  view :normal do
    field :id
    association :product, blueprint: Products::ProductBlueprint, view: :show
  end
end