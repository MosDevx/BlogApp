class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  after_save :likes_counter

  validates :title, presence: true, length: { minimum: 1, maximum: 20 }
  validates :text, presence: true, length: { minimum: 1, maximum: 1000 }

  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def likes_counter
    post.update(likes_count: post.likes.all.length)
  end
end
