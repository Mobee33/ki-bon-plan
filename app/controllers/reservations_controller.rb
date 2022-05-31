class ReservationsController < ApplicationController
  before_action :set_activity, only: [:new, :create]


  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.activity = @Activity
    @reservation.user = current_user
    @review = Review.new
    if @reservation.save
      redirect_to activity_path(@activity)
    else
      render 'activities/show'
    end
  end

  def destroy
    @reservation = reservation.find(params[:id])
    @reservation.destroy
    redirect_to activity_path(@reservation.activity)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date, :number_of_people)
  end

  def set_activity
    @activity = Activity.find(params[:activity_id])
  end
end
