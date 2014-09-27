class Document < Sequel::Model
  one_to_many(:permissions)
  one_to_many(:versions)
end
