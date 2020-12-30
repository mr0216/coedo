class UsersController < ApplicationController

  def index
    @users = User.all.order(id: :DESC).page(params[:page]).per(5)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @posts = Post.order('created_at DESC')
  end

  def edit
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to action: :index
    end
  end

  def update
    @user = User.find(params[:id])
    if current_user.update(user_params)
      redirect_to user_path(current_user.id)
      sign_in(current_user, bypass: true)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:nickname,:email, :password, :password_confirmation, :category_id, :introduction, :url, :business_hour, :address, :latitude,:longitude, :phone_number, :image)
  end
end