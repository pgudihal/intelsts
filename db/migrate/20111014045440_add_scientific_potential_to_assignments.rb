class AddScientificPotentialToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :scientific_potential, :float
  end
end
