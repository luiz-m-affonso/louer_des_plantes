class BookingsController < ApplicationController
  before_action :set_booking, only: [:new, :create, :destroy]

  def new
    @booking = Booking.new(booking_params)
  end
end
