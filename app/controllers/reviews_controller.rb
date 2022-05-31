class ReviewsController < ApplicationController
  before_action :set_activity, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.activity = @activity
    @review.user = current_user
    if @review.save
      redirect_to activity_path(@activity)
    else
      render 'activities/show'
    end
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

  def set_activity
    @activity = Activity.find(params[:activity_id])
  end
end
