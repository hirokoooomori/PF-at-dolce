class CreateShopGenreNames < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_genre_names do |t|
      t.string :name
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
