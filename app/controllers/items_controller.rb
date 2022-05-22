class ItemsController < ApplicationController


  def index
    @items = Item.all
    # Item.order(all_rating: :desc)
    @reviews = Review.all
    @all_rating = "総合評価"
    @rating1 = "甘味評価"
    @rating2 = "酸味評価"
    @rating3 = "水分評価"
    @rating4 = "食べやすさ評価"  
  end

  def show
    @item = Item.find(params[:id])
    @review = Review.new
    @reviews = @item.reviews.includes(:user)
    gon.item = @item
    gon.review = @review    
    gon.data1 = @item.reviews.average(:rating1).to_f.round(1)
 end

end