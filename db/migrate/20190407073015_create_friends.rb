class CreateFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|
      t.references :member, foreign_key: true
      t.references :friend_member, foreign_key: true

      t.timestamps
    end
  end
end
