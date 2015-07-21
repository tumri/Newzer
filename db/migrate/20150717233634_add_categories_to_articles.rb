class AddCategoriesToArticles < ActiveRecord::Migration
  def change
    add_reference :articles, :category, index: true, foreign_key: true
    add_index :articles, [:category_id, :created_at]
  end
end
