class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @my_name = %w[A B C]
    @user = User.find(params[:id])
    # @recent_posts = @user.recent_posts
    # @all_po:insts = @user.posts
  end
end
