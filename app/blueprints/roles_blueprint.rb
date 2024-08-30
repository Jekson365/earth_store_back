class RolesBlueprint < Blueprinter::Base
  view :normal do
    fields :name,:id
  end
end