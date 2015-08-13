class Comment < ActiveRecord::Base
  belongs_to :article

  belongs_to :user

  # attr_accessible :body, :article_id, :user_id

  has_closure_tree order: 'created_at ASC', with_advisory_lock: true

  # default_scope -> { order(created_at: :desc) }

  validates :body,
            presence: true,
            length: { minimum: 10, maximum: 500 }

  validates :article_id,
            presence: true

  validates :user_id,
            presence: true
end
