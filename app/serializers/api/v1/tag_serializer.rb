# frozen_string_literal: true

module Api
  class V1::TagSerializer < ActiveModel::Serializer
    attributes :id, :title
    has_many :tasks
  end
end
