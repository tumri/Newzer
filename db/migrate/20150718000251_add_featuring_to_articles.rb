class AddFeaturingToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :featured, :boolean, default: false
  end
end
