class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @plants = policy_scope(Plant).order(created_at: :desc)
  end

  def components
  end
end
