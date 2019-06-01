module Api
  class V1::TaskSerializer < ActiveModel::Serializer
    attributes :id, :title
    has_many :tags
  end
end