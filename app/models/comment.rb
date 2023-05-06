class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, counter_cache: true

  validates :text, presence: true, length: { minimum: 1, maximum: 1000 }
end
