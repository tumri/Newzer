class Article < ActiveRecord::Base
  belongs_to      :user

  belongs_to      :category

  has_many        :comments,     dependent: :destroy

  # attr_accessible :title, :body, :category_id, :user_id

  default_scope -> { order(created_at: :desc) }

  validates       :user_id,      presence: true
  validates       :category_id,  presence: true
  validates       :title,        presence: true
  validates       :body,         presence: true
end
