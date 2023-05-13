class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
    @most_recent_comments = @post.most_recent_comments
  end

  def custom_post
    @post = Post.find(params[:id])
  end
end
