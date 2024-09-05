module Categories
  class CategoriesBlueprint < Blueprinter::Base
    view :normal do
      identifier :id
      fields :name,:description
    end
  end
end