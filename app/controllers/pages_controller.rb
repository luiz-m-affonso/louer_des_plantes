class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :comṕonents]

  def home
    if params[:query].present?
      @plants = policy_scope(Plant).search_by_names_and_family(params[:query])
    else
      @plants = []
    end
  end

  def components
  end

  def profile
    @bookings = Booking.where(user_id: current_user.id)
    @plants = Plant.where(user_id: current_user.id)
  end
end
