class UsersController < ApplicationController

  def index
    @users = User.all
    @user = User.all.order(id: 'ASC')
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @posts = Post.order('created_at DESC')
  end
end
