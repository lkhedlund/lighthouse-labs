class RemoveTimestampFromStudentsAndTeachers < ActiveRecord::Migration

  def change
    change_table :students do |t|
      t.remove :created_at, :updated_at
    end
    change_table :teachers do |t|
      t.remove :created_at, :updated_at
    end
  end
end
