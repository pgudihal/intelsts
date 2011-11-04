class AddEntryScoreToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :entry_score, :float
  end
end
