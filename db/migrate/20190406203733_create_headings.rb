class CreateHeadings < ActiveRecord::Migration[5.2]
  def change
    create_table :headings do |t|
      t.string :text
      t.integer :member_id

      t.timestamps
    end
  end
end
