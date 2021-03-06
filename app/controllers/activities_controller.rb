class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @activities = Activity.global_search(params[:query])
    else
      @activities = Activity.all
    end
    # @markers = @activities.geocoded.map do |activity|
    #   {
    #     lat: activity.latitude,
    #     lng: activity.longitude
    #   }
    # end
  end

  def show
    @marker = [{
      lat: @activity.latitude,
      lng: @activity.longitude
    }]
    @review = Review.new
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.user = current_user
    if @activity.save
      redirect_to activity_path(@activity)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @activity.update(activity_params)
      redirect_to activity_path(@activity)
    else
      render :new
    end
  end

  def destroy
    @activity.destroy
    redirect_to activities_path
  end

  private

  def activity_params
    params.require(:activity).permit(:details, :price, :address, :title, :category, :latitude, :short_description, :longitude, photos: [])
  end

  def set_activity
    @activity = Activity.find(params[:id])
  end
end
