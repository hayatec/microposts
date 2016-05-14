class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :likes, index: true
      t.references :liked, index: true

      t.timestamps null: false
      t.index [:likes_id, :liked_id], unique: true
    end
  end
end
