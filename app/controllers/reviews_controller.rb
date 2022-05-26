class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @activity = Activity.find(params[:activity_id])
    @review.activity = @activity
    if @review.save
      redirect_to activity_path(@activity)
    else
      render 'activities/show'
  end

  def destroy
    @review =review.find(params[:id])
    @review.destroy
    redirect_to activity_path(@review.activity)
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
