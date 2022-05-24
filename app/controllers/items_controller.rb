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
    gon.allavg = @reviews.average(:all_rating).to_f.round(1)
  end

  def show
    @item = Item.find(params[:id])
    @review = Review.new
    @reviews = @item.reviews.includes(:user)
    gon.item = @item
    gon.review = @review    
    gon.all = @item.reviews.average(:all_rating).to_f.round(1)
    gon.rate1 = @item.reviews.average(:rating1).to_f.round(1)
    gon.rate2 = @item.reviews.average(:rating2).to_f.round(1)
    gon.rate3 = @item.reviews.average(:rating3).to_f.round(1)
    gon.rate4 = @item.reviews.average(:rating4).to_f.round(1)

   gon.allave = @reviews.average(:all_rating)
 end

end