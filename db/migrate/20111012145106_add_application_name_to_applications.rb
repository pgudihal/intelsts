class AddApplicationNameToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :application_name, :string
  end
end
