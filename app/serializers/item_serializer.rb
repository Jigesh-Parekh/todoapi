class ItemSerializer < ActiveModel::Serializer
  attributes :id, :info

  def info
  	object.info
  end
end
