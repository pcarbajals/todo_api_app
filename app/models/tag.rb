# frozen_string_literal: true

# The Tag model has the following characteristics:
# - A tag can't have an empty title
# - A tag has a unique title (to avoid duplicate tag records with same title)
# - A tag can be associated to many tasks
class Tag < ApplicationRecord
  validates_presence_of :title
  validates_uniqueness_of :title
  has_and_belongs_to_many :tasks
end
