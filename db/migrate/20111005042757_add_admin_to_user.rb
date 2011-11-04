class AddAdminToUser < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, :default => false
  end
  
  def self.down
    remove_colum :users, :admin
  end
end
