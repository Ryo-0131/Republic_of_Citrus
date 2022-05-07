class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :prevent_url, only: [:edit, :destroy]

  def create
  end

  def show
  end

  def edit
  end

  def update
   if current_user.update(user_params)
       redirect_to root_path
    else
       render :edit
    end
  end
 
   private

   def set_user
    @user = User.find(params[:id]) 
   end

   def prevent_url
    unless @user.id == current_user.id
      redirect_to root_path
    end
   end
 
   def user_params
     params.require(:user).permit(:name, :email, :nickname, :prefecture_id, :favorite_id, :introduction, :image)
   end

  end


  