class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id', counter_cache: true
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  # after_save :update_author_posts_count

  validates :title, presence: true, length: { minimum: 1, maximum: 20 }
  validates :text, presence: true, length: { minimum: 1, maximum: 1000 }

  # validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  # validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_author_posts_count
    author.update(posts_count: author.posts.count)
  end
end
