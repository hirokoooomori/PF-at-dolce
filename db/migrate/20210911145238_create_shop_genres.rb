class CreateShopGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_genres do |t|
      t.integer :shop_id
      t.integer :shop_genre_name_id
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
