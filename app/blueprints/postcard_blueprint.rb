class PostcardBlueprint < Blueprinter::Base
  view :normal do
    fields :title, :min_title
    field :image do |postcard, _options|
      postcard.image
    end
  end
  view :normal_ka do
    field :image do |postcard, _options|
      postcard.image
    end
    field :title_ka
    field :min_title_ka
  end
end