class Permission < Sequel::Model
  many_to_one(:document)
  many_to_one(:user)

  def creator?
    role == "creator"
  end
  def editor?
    role == "editor"
  end
  def pending?
    role == "pending"
  end
end
