class ItemsController < ApplicationController


  def index
    @items = Item.all
    # Item.order(all_rating: :desc)
  end

  def show
    @item = Item.find(params[:id])
    @review = Review.new
    @reviews = @item.reviews.includes(:user)
 end

end