class RenameImageIdColumnToCustomers < ActiveRecord::Migration[5.2]
  def change
    rename_column :customers, :ImageId, :image_id
  end
end
