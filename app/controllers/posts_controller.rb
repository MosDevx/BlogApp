class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.includes(:user, comments: :user).where(user_id: params[:user_id])
    # @user = @posts.user
  end

  def show
    @post = Post.includes(:comments).find(params[:id])
    # @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.new(user: @user, title: params[:title], text: params[:text])

    if @post.save
      flash[:success] = 'Post saved !!'
      redirect_to user_path(@user)
    else
      puts 'Post not saved'
      render 'new'
    end
  end
end
