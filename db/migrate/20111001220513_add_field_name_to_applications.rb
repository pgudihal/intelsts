class AddFieldNameToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :field_name, :string
  end
end
