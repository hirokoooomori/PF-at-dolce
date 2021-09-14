class AddStatusToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :status, :string
  end
end
