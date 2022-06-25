# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def show
   end

  def create
    # フォーム送信成功時、showページに戻る際にitem_idが必要なので、@itemを定義
    @item = Item.find(params[:item_id])
    @review = Review.create(review_params)
    if @review.save
      flash[:notice] = "送信しました。"
      redirect_to item_path(@item.id), notice:
    else
      @item = @review.item
      @reviews = @item.reviews
      render 'items/show'
    end
  end

  def edit
    # @review = Review.create(review_params)
    @item = Item.find(params[:item_id])
    @review = Review.find(params[:id])
    redirect_to root_path unless @review.user.id == current_user.id
  end

  def update
    @item = Item.find(params[:item_id])
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
   # フォーム送信成功時、showページに戻る際にitem_idが必要なので、@itemを定義
    @item = Item.find(params[:item_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to item_path(@item.id)
    redirect_to root_path unless @review.user.id == current_user.id
  end

  private

  def review_params
    params.require(:review).permit(:comment, :all_rating, :rating1, :rating2, :rating3, :rating4).merge(
      user_id: current_user.id, item_id: params[:item_id]
    )
  end
end
