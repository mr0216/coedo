class PostsController < ApplicationController

  def index
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render "posts/new"
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :category_id, :text, :image).merge(user_id: current_user.id)
  end
end
