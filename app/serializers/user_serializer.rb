class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :photo, :current
end
