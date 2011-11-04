class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :application_id
      t.integer :evaluator_id
      t.integer :score_id

      t.timestamps
    end
  end
end
