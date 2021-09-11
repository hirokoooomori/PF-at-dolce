class AddAreaIdToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :area_id, :integer
  end
end
