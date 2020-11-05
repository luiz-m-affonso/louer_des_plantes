class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :components, :map]

  def home
    @plants = policy_scope(Plant).order(created_at: :desc)
  end

  def components
  end

  def profile
    @bookings = Booking.where(user_id: current_user.id)
    @plants = Plant.where(user_id: current_user.id)
  end

  def map
    @plants = Plant.all
    @markers = @plants.geocoded.map do |plant|
      {
        lat: plant.latitude,
        lng: plant.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { plant: plant })
      }
    end
  end
end
