class AddFileNameToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :filename, :string
  end
end
