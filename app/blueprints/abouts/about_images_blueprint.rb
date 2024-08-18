module Abouts
  class AboutImagesBlueprint < Blueprinter::Base
    view :normal do
      fields :image
    end
  end
end