class AddModerationToComments < ActiveRecord::Migration
  def change
    add_column :comments, :flagged, :boolean, default: false
    add_column :comments, :unflagged, :boolean, default: false
  end
end
