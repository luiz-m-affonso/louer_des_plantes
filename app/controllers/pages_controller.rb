class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :comṕonents]

  def home
    @plants = policy_scope(Plant).order(created_at: :desc)
  end

  def components
  end

  def profile
    @bookings = Booking.where(user_id: current_user.id)
  end
end
