class LikesController < ApplicationController

	def new
		@user = User.find(params[:user_id])
		@post = Post.find(params[:post_id	])		
		@like = Like.new(user:@user, post:@post)
		if @like.save
			redirect_to request.referrer
		else
			render '/users'
		end
	end
end
