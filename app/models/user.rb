class User < ApplicationRecord

 has_many :posts , dependent: :destroy
 has_many :comments , dependent: :destroy
 has_many :likes , dependent: :destroy

 validates :name , presence: true , length: {minimum: 1 , maximum: 20}
 validates :bio , length: {minimum: 1 , maximum: 100}


 def recent_posts
	posts.order(created_at: :desc).limit(3)
 end
 
end
