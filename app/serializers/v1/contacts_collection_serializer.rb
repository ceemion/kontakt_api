class V1::ContactsCollectionSerializer < ActiveModel::Serializer
  attributes :data

  def data
    object.map do |resource|
      V1::ContactsSerializer.new(resource)
    end
  end
end
