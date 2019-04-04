class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :name
      t.string :url_long
      t.string :url_short

      t.timestamps
    end
    add_index :members, :name, unique: true
  end
end
