class UsersController < ApplicationController

  def index
    @users = User.all.order(id: :DESC).page(params[:page]).per(5)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @posts = Post.order('created_at DESC')
  end
end
