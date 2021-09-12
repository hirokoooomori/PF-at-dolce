class RemoveAtmosphereFromShops < ActiveRecord::Migration[5.2]
  def change
    remove_column :shops, :atmosphere, :string
  end
end
