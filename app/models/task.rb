# frozen_string_literal: true

class Task < ApplicationRecord
  validates_presence_of :title

  has_and_belongs_to_many :tags

  def tags=(tags)
    tags = tags.map do |tag|
      if tag.is_a? Tag
        tag
      elsif tag.is_a? String
        Tag.find_or_create_by!(title: tag)
      else
        raise ArgumentError, "Tag type is unknown: #{tag.class}"
      end
    end

    super(tags)
  end
end
