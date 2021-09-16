class AddCustomerIdToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :customer_id, :integer
  end
end
