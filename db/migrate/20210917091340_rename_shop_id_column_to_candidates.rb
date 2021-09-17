class RenameShopIdColumnToCandidates < ActiveRecord::Migration[5.2]
  def change
    rename_column :candidates, :Shop_id, :shop_id
  end
end
