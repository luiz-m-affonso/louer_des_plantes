class BookingsController < ApplicationController
  before_action :set_booking, only: [:new, :create, :destroy]

  def new
    @booking = Booking.new(booking_params)
  end

  def create
    @plant = Plant.find(params[:plant_id])
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to booking_path(@booking)
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
