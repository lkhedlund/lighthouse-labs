class AddTeacherIdToStudents < ActiveRecord::Migration

  def change
    change_table :students do |t|
      t.integer :teacher_id
    end
  end
end
