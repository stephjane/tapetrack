class AddValueToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :tape_id, :integer
  end
end
