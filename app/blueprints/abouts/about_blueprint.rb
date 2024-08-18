module Abouts
  class AboutBlueprint < Blueprinter::Base
    view :normal do
      fields :id,:title, :description
      association :about_image, blueprint: Abouts::AboutImagesBlueprint,view: :normal
    end
  end
end