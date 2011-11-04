class RemoveAssignmentIdFromScore < ActiveRecord::Migration
  def up
    remove_column :scores, :assignment_id
  end

  def down
    add_column :scores, :assignment_id, :integer
  end
end
