class AddIndexShopIdToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_index :favorites, :shop_id, unique: true
  end
end
