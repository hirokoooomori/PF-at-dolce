class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.string :image_id
      t.string :password
      t.boolean :is_deleted
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
