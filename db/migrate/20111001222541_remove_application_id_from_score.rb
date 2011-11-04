class RemoveApplicationIdFromScore < ActiveRecord::Migration
  def up
    remove_column :scores, :application_id
  end

  def down
    add_column :scores, :application_id, :integer
  end
end
