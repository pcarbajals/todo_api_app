class AddUniqueToTagsTasksIndex < ActiveRecord::Migration[5.2]
  def change
    add_index :tags_tasks, %i[task_id tag_id], unique: true
  end
end
