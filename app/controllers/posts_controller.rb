class PostsController < ApplicationController
  before_action :authenticate_user!, except:[:index,:show]

  def index
    @posts = Post.all
    # @posts = Post.include(:user)
    @post = Post.order('created_at DESC')
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

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :category_id, :text, :image).merge(user_id: current_user.id)
  end
end
