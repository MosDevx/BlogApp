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

  def new
    @post = Post.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.new(user: @user, title: params[:title], text: params[:text])

    if @post.save
      redirect_to user_path(@user)
    else
      puts 'Post not saved'
      render 'new'
    end
  end
end
