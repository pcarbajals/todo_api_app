class Tag < ApplicationRecord
  validates_presence_of :title
  has_and_belongs_to_many :tasks
end
