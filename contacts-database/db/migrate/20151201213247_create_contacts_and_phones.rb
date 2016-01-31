class CreateContactsAndPhones < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.timestamps
    end
    create_table :phones do |t|
      t.integer :contact_id
      t.string :phone_type
      t.string :phone_number
      t.timestamps
    end
  end
end
