class ReviewsController < ApplicationController

  def show
  end

  def create
    @review = Review.create(review_params)
  if @review.save
    redirect_to root_path
  else
    @item = @review.item
    @reviews = @item.reviews
    render "items/show"
  end
  end
  
  private
    def review_params
      params.require(:review).permit(:comment, :all_rating, :rating1, :rating2, :rating3, :rating4).merge(user_id: current_user.id, item_id: params[:item_id])
    end

end