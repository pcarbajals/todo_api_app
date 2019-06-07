class AddUniquenessConstraintToTagTitle < ActiveRecord::Migration[5.2]
  def change
    add_index :tags, :title, unique: true
  end
end
