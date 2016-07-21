class ListSerializer < ActiveModel::Serializer
  attributes :id, :listname

  def listname
  	object.listname
  end
end
