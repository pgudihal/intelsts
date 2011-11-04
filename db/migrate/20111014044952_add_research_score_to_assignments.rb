class AddResearchScoreToAssignments < ActiveRecord::Migration
  def change
  	add_column :assignments, :research_score, :float
  end
end
