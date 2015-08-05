class CreateCommentHierarchies < ActiveRecord::Migration
  def change
    create_table :comment_hierarchies, :id => false do |t|
      t.integer  :ancestor_id, :null => false
      t.integer  :descendant_id, :null => false
      t.integer  :generations, :null => false
    end
    add_index :comment_hierarchies, [:ancestor_id, :descendant_id, :generations],
              :unique => true, :name => 'index_comment_hierarchy_for_descendant_leaf_select'
    add_index :comment_hierarchies, [:descendant_id],
              :name => 'index_comment_hierarchy_for_ancestor_select'
  end
end
