# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_user, only: %i[show edit update destroy]
  before_action :prevent_url, only: %i[edit destroy]

  def create; end

  def show; end

  def edit; end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  # いいねした投稿を探し、@like_itemsに格納
  def likes
    @user = User.find(params[:id])
    likes = Like.where(user_id: @user.id).pluck(:item_id)
    @like_items = Item.find(likes)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def prevent_url
    redirect_to root_path unless @user.id == current_user.id
  end

  def user_params
    params.require(:user).permit(:name, :email, :nickname, :prefecture_id, :favorite_id, :introduction, :image)
  end
end
