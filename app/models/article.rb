class Article < ActiveRecord::Base
  belongs_to :user

  belongs_to :category

  has_many   :comments,     dependent: :destroy

  # attr_accessible :title, :body, :category_id, :user_id

  default_scope -> { order(created_at: :desc) }

  validates :title,
            presence: true,
            length: { minimum: 2, maximum: 75 }

  validates :body,
            presence: true,
            length: { minimum: 100, maximum: 25_000 }

  validates :user_id,
            presence: true

  validates :category_id,
            presence: true
end
