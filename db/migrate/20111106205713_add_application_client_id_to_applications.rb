class AddApplicationClientIdToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :app_client_id, :integer
  end
end
