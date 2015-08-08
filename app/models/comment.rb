class Comment < ActiveRecord::Base
  belongs_to      :article

  belongs_to      :user

  # attr_accessible :body, :article_id, :user_id

  has_closure_tree order: 'created_at DESC'

  # default_scope -> { order(created_at: :desc) }

  validates       :body,         presence: true
  validates       :article_id,   presence: true
  validates       :user_id,      presence: true
end
