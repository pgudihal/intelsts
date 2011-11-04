class DropTableFields < ActiveRecord::Migration
  def up
  	drop_table :fields
  end

  def down
  	create_table :fields do |t|
      t.string   :field_name
    
      t.timestamps
  end
  end
end
