class UsersController < ApplicationController

  def index
    @posts = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :category_id, :image).merge(user_id: current_user.id)
  end

end
