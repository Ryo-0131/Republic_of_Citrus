class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  
  def create
  end

  def show
    @user = User.find(params[:id]) 
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
 
   def user_params
     params.require(:user).permit(:name, :email, :nickname, :prefecture_id, :favorite_id, :introduction, :image)
   end

end