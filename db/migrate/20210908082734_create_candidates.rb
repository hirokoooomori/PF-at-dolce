class CreateCandidates < ActiveRecord::Migration[5.2]
  def change
    create_table :candidates do |t|
      t.integer :Shop_id
      t.integer :customer_id
      t.string :candidate
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
