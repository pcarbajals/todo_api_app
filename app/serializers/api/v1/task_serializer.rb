# frozen_string_literal: true

module Api
  module V1
    class TaskSerializer < ActiveModel::Serializer
      attributes :id, :title
      has_many :tags
    end
  end
end
