# frozen_string_literal: true

class Task < ApplicationRecord
  validates_presence_of :title
  has_and_belongs_to_many :tags
end
