class DropTableScores < ActiveRecord::Migration
  def up
  	drop_table :scores
  end


  def down
  	 create_table :scores do |t|
      t.float :research_score
      t.float :scientific_potential
      t.float :entry_score

      t.timestamps
  end
end
end
