# frozen_string_literal: true

module Api
  module V1
    class TagSerializer < ActiveModel::Serializer
      attributes :id, :title
      has_many :tasks
    end
  end
end
