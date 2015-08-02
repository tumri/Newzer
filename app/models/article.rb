class Article < ActiveRecord::Base
  belongs_to    :user

  belongs_to    :category

  has_many      :comments,     dependent: :destroy

  default_scope -> { order(created_at: :desc) }

  has_closure_tree

  validates     :user_id,      presence: true
  validates     :category_id,  presence: true
  validates     :title,        presence: true
  validates     :body,         presence: true
end
