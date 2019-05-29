class V1::TagSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_one :task
end
