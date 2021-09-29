class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.integer :comment_id
      t.string :name
      t.string :image_id
      t.string :business_day
      t.string :eat_in
      t.string :take_out
      t.string :budget
      t.text :google_map_id
      t.datetime :created_at
      t.datetime :update_at
      t.integer :area_id
      t.integer :atmosphere_id
      t.timestamps
    end
  end
end
