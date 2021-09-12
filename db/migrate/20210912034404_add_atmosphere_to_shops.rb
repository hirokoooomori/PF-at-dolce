class AddAtmosphereToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :atmosphere, :string
  end
end
