class RenameIsDeletedColumnToCustomers < ActiveRecord::Migration[5.2]
  def change
    rename_column :customers, :IsDeleted, :is_deleted
  end
end
