class CreateTapes < ActiveRecord::Migration
  def change
    create_table :tapes do |t|
      t.string :title
      t.string :friend
      t.text :note

      t.timestamps null: false
    end
  end
end
