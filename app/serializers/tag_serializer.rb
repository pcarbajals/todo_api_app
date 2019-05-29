class TagSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_one :task
end
