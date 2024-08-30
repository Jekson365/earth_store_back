class UsersBlueprint < Blueprinter::Base
  view :normal do
    fields :email,:username,:confirmed_at,:id
    association :role,blueprint: RolesBlueprint,view: :normal
  end
end