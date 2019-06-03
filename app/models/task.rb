# frozen_string_literal: true

# The Task model has the following characteristics:
# - A task can't have an empty title
# - A task can be associated to many tags
# - When setting tags, they can be specified as type of Tag and String. Any other type will raise an error.
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
