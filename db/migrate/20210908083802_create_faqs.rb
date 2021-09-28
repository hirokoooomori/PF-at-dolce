class CreateFaqs < ActiveRecord::Migration[5.2]
  def change
    create_table :faqs do |t|
      t.string :frequently
      t.string :question
      t.integer :admin_id
      t.integer :contact_id
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
