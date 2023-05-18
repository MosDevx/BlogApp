class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
  end


  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])

    @comment = Comment.new(user: @user, post: @post, text: params[:text])

    if @comment.save
      redirect_to user_post_path(@user, @post)
    else
      render 'new'
    end
  end
end
