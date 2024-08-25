class OpeningBlueprint < Blueprinter::Base
  view :normal do
    fields :id, :title, :min_title
    association :opening_images,blueprint: OpeningImagesBlueprint,view: :normal
  end
end