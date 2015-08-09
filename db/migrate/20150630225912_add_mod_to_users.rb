class AddModToUsers < ActiveRecord::Migration
  def change
    add_column :users, :mod, :boolean, default: false
  end
end
