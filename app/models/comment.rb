class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post
  after_save :comments_counter

  validates :text, presence: true, length: { minimum: 1, maximum: 1000 }

  private
  def comments_counter
    post.update(comments_count: post.comments.all.length)
  end
end
