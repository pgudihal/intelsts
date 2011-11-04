class ChangeDataTypeForEvaluatorZipCode < ActiveRecord::Migration
   def self.up
    change_table :evaluators do |t|
      t.change :zip_code, :string
    end
  end

  def self.down
    change_table :evaluators do |t|
      t.change :zip_code, :integer
    end
  end
end
