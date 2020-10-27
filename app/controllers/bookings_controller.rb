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
end
