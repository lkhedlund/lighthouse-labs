class AddReviewsTable < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :song_id
      t.text :content
      t.integer :rating
      t.timestamps
    end
  end
end
