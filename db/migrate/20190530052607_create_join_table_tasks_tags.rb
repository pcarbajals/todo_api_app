# frozen_string_literal: true

class CreateJoinTableTasksTags < ActiveRecord::Migration[5.2]
  def change
    create_join_table :tasks, :tags do |t|
      t.belongs_to :task, index: true
      t.belongs_to :tag, index: true
    end
  end
end
