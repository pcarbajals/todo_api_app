# frozen_string_literal: true

class Tag < ApplicationRecord
  validates_presence_of :title
  validates_uniqueness_of :title
  has_and_belongs_to_many :tasks
end
