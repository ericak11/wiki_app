class Version < Sequel::Model
  many_to_many(:tags)
  many_to_one(:document)
  many_to_one(:user)
end
