class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id', counter_cache: true
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: true, length: { minimum: 1, maximum: 20 }
  validates :text, presence: true, length: { minimum: 1, maximum: 1000 }

  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
