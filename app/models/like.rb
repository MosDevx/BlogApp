class Like < ApplicationRecord
  # belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :user
  belongs_to :post, counter_cache: true
  # after_save :update_likes_counter

  private

  def update_likes_counter
    post.update(likes_count: post.likes.all.length)
  end
end
