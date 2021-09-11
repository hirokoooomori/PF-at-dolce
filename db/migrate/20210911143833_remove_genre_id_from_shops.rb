class RemoveGenreIdFromShops < ActiveRecord::Migration[5.2]
  def change
    remove_column :shops, :genre_id, :integer
  end
end
