class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :name
      t.string :email
      t.integer :tape_id

      t.timestamps null: false
    end
  end
end
