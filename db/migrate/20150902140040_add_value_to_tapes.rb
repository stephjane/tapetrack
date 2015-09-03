class AddValueToTapes < ActiveRecord::Migration
  def change
    add_column :tapes, :user_id, :integer
  end
end
