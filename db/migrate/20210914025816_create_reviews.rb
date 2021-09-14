class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :customer, foreign_key: true
      t.references :shop, foreign_key: true
      t.string :comment
      t.integer :score
      t.integer :shop__id
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
