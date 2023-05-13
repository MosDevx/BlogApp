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
    puts '^^^^^^^New is ^^'
    @post = Post.new
  end

  def create
    @post = Post.new(user: @current_user, title: params[:title], text: params[:text])

    if @post.save
      redirect_to '/users'
    else
      puts 'Post not saved'
      render 'new'
    end
  end
end
