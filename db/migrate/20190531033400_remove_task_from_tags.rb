# frozen_string_literal: true

class RemoveTaskFromTags < ActiveRecord::Migration[5.2]
  def change
    remove_column :tags, :task_id 
  end
end
