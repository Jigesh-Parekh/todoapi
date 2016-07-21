class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :password

  def name
  	object.name
  end

  def password
  	object.password
  end
end
