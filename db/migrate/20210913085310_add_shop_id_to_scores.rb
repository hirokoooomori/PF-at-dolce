class AddShopIdToScores < ActiveRecord::Migration[5.2]
  def change
    add_column :scores, :shop_id, :integer
  end
end
