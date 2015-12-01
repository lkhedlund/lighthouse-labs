class CreateTeachers < ActiveRecord::Migration

  def change
    create_table :teachers do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :phone
      t.timestamps null: false
    end
  end
end
