class ShopBlueprint < Blueprinter::Base
  identifier :id

  view :normal do
    field  :title
  end

  view :extended do
    fields  :title
    association :authors, blueprint: AuthorBlueprint 
  end
end
