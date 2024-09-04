class OpeningBlueprint < Blueprinter::Base
  view :normal do
    fields :id, :title, :min_title
    association :opening_images, blueprint: OpeningImagesBlueprint, view: :normal
  end
  view :normal_ka do
    fields :id
    field :title_ka
    field :min_title_ka
    association :opening_images, blueprint: OpeningImagesBlueprint, view: :normal
  end
end