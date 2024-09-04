class PostcardBlueprint < Blueprinter::Base
  view :normal do
    fields :title, :min_title,:image
  end
end