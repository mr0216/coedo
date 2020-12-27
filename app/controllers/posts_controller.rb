class PostsController < ApplicationController
  before_action :authenticate_user!, except:[:index,:show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :contributor_confirmation, only: [:edit, :destroy]

  def index
    @posts = Post.all.order('created_at DESC')
    @posts = Post.includes(:user)
    @posts = Post.page(params[:page]).per(8)
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

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    if @post.destroy
      redirect_to root_path
    else
      render root_path
    end
  end
  private

  def set_post
    @post = Post.find(params[:id])
  end

  def contributor_confirmation
    unless @post.user_id == current_user.id
      redirect_to root_path
    end
  end

  def post_params
    params.require(:post).permit(:title, :category_id, :text, :image).merge(user_id: current_user.id)
  end
end
