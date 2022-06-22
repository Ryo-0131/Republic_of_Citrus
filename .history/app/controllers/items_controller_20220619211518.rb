class ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page]).per(10).order(all_rating: "ASC")
    @itemsindex = Item.all
    # Item.order(all_rating: :desc)
    @reviews = Review.all
    @all_rating = '総合評価'
    @rating1 = '甘味評価'
    @rating2 = '酸味評価'
    @rating3 = '水分評価'
    @rating4 = '食べやすさ評価'
    @itemname =  Item.pluck(:item_name)
    gon.itemname = @itemname
    @data = [['a', 100], ['b', 200], ['c', 500]]
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

    @all_rating = '総合評価'
    @rating1 = '甘味評価'
    @rating2 = '酸味評価'
    @rating3 = '水分評価'
    @rating4 = '食べやすさ評価'

    gon.allave = @reviews.average(:all_rating)
  end

  def ranking
    @items = Item.all
    reviews = Review.all
    @itemname = Item.pluck(:item_name)
    @datas = Review.pluck(:all_rating)

    @items.each do |item|
      @ratesum = item.reviews.sum(:all_rating) # カラムのデータの合計値
      @ratecount = item.reviews.count(:all_rating) # カラムのデータ個数
      @rateavg = @ratesum.to_f / @ratecount
      gon.rateavg = @rateavg
    end

    gon.allavg = @reviews.average(:all_rating).to_f.round(1)

    reviews = Review.all
    @all = reviews.map { |review| review.all_rating }
    gon.all = @all
  end
end
