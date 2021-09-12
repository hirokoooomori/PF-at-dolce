class RemoveProductIdFromShops < ActiveRecord::Migration[5.2]
  def change
    remove_column :shops, :product_id, :integer
  end
end
