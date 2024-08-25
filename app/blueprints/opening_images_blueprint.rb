class OpeningImagesBlueprint < Blueprinter::Base
  view :normal do
    fields :opening_id,:image,:id
  end
end