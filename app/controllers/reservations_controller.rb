class ReservationsController < ApplicationController
  before_action :set_reservation, only: :create

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.activity = @Activity
    if @reservation.save
      redirect_to activity_path(@activity)
    else
      render 'activities/show'
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

  def set_reservation
    @reservation = Reservation.find(param[:activity_id])
  end
end
