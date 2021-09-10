class AddImageIdToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :ImageId, :string
  end
end
