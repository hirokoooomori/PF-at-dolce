class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.integer :customer_id
      t.string :name, null: false

      t.text :message, null: false
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
