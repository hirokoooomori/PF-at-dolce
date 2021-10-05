class ChangeDataEatInToShops < ActiveRecord::Migration[5.2]
  def change
    change_column :shops, :eat_in, :boolean
    change_column :shops, :take_out, :boolean
  end
end
