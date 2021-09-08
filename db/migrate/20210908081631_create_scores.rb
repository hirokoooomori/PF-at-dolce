class CreateScores < ActiveRecord::Migration[5.2]
  def change
    create_table :scores do |t|
      t.integer :user_id
      t.string :five_score
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
