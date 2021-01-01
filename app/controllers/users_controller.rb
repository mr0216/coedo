class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :contributor_confirmation, only: [:edit, :destroy]

  def index
    @users = User.all.order(id: :DESC).page(params[:page]).per(5)
  end

  def show
    @posts = @user.posts
    @posts = Post.order('created_at DESC')
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user.id)
      sign_in(current_user, bypass: true)
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_to root_path
    else
      render root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :category_id, :introduction, :url, :business_hour, :address, :latitude, :longitude, :phone_number, :image)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def contributor_confirmation
    redirect_to action: :index unless @user.id == current_user.id
  end
end
