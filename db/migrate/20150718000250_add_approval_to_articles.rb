class AddApprovalToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :approved, :boolean, default: false
  end
end
