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
    @itemname =  Item.pluck(:item_name)
    gon.itemname = @itemname
    gon.allavg = @reviews.average(:all_rating).to_f.round(1)
    gon.rating1avg = @reviews.average(:rating1).to_f.round(1)
    # gon.rating1 = Item.where.pluck(:rating1)
 
    reviews = Review.all
    @items.each do |item|
    @ratesum= item.reviews.sum(:all_rating)  # カラムのデータの合計値 
    @ratecount= item.reviews.count(:all_rating) # カラムのデータ個数
    @rateavg = @ratesum.to_f/@ratecount
    end
    
    @items.each do |item|
     gon.kan = item.reviews.average(:all_rating).to_f.round(1)
     end



    # @items.each do |item|
    #    @itema = item.reviews.average(:all_rating).to_f.round(1)
    # end

    r_reviews = Review.pluck(:all_rating)
    # @labels = reviews.map(&:first)
    @datas = r_reviews.map(&:second)
    #@labels = ["◯っ◯◯","π","パイナップル", "ニシンパイ", "パイルドライバー"]
    #@datas = [9999, 3141, 2, 8, 1000]

    reviews = Review.all
    @all = reviews.map { |review| review.all_rating }

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