class CreateEvaluators < ActiveRecord::Migration
  def change
    create_table :evaluators do |t|
      t.integer :user_id
      t.integer :field_id
      t.text :address
      t.string :city
      t.string :state
      t.integer :zip_code
      t.boolean :agreement

      t.timestamps
    end
  end
end
