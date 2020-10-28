class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
  end

  def components
  end
end
