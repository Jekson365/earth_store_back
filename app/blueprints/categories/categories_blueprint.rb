module Categories
  class CategoriesBlueprint < Blueprinter::Base
    view :normal do
      identifier :id
      fields :name
    end
  end
end