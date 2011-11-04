class RemoveFieldIdFromEvaluators < ActiveRecord::Migration
  def up
    remove_column :evaluators, :field_id
  end

  def down
    add_column :evaluators, :field_id, :integer
  end
end
