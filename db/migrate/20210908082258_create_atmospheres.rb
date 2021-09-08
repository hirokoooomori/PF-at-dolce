class CreateAtmospheres < ActiveRecord::Migration[5.2]
  def change
    create_table :atmospheres do |t|
      t.string :atmosphere
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
