class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.new(review_params)
    @review.user_id = current_user.id
    @review.save
    redirect_to restaurants_path
  end

  def destroy
    @review = Review.find(params[:id])
    @restaurant = @review.restaurant_id
    @review.destroy
    flash[:notice] = 'Review deleted successfully'
    redirect_to restaurant_path(@restaurant)
  end

  private

  def review_params
    params.require(:review).permit(:thoughts, :rating)
  end

end
