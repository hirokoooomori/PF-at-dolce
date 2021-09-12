class AddAtmosphereIdToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :atmosphere_id, :integer
  end
end
