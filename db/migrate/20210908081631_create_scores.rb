class CreateScores < ActiveRecord::Migration[5.2]
  def change
    create_table :scores do |t|
      t.integer :customer_id
      t.integer :shop_id
      t.datetime :created_at
      t.datetime :updated_at
      t.float :rate, null: false
      
      t.timestamps
    end
  end
end
