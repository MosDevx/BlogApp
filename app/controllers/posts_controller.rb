class PostsController < ApplicationController
  def index; end

  def show
    @post = params[:id]
  end
end
