class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])

    @comment = Comment.new(user: @current_user, post: @post, text: params[:text])

    if @comment.save
      redirect_to '/users'
    else
      render 'new'
    end
  end
end
