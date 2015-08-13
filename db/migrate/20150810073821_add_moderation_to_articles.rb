class AddModerationToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :reported, :boolean, default: false
  end
end
