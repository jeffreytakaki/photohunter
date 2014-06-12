class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :caption
end
