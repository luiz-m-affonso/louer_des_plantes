class BookingsController < ApplicationController
  before_action :set_booking, only: [:destroy]

  def new
    @plant = Plant.find(params[:plant_id])
    @booking = Booking.new
    authorize(@booking)
  end

  def create
    @plant = Plant.find(params[:plant_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.plant = @plant
    authorize(@booking)
    if @booking.save
      redirect_to profile_path
    else
      redirect_to plant_path(@plant)
    end
  end

  def destroy
    @booking.destroy
    redirect_to root_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_booking
    @booking = Booking.find(params[:booking])
  end
end
