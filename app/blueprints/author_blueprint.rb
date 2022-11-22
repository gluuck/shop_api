class AuthorBlueprint < Blueprinter::Base
  identifier :id

  field  :name
  association :books, blueprint:BookBlueprint
end
