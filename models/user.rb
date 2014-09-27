class User < Sequel::Model
  plugin :secure_password
  one_to_many(:permissions)
  one_to_many(:versions)

  def admin?
    role == "admin"
  end
end
