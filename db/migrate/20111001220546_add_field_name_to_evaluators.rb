class AddFieldNameToEvaluators < ActiveRecord::Migration
  def change
    add_column :evaluators, :field_name, :string
  end
end
