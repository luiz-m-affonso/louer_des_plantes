class PlantsController < ApplicationController
  before_action :set_plant, only: [:show, :edit, :update, :destroy]
  def index
    @plants = Plant.all
  end

  def show; end

  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.create(plant_params)
    if @plant.save
      redirect_to plant_path(@plant)
    else
      render 'new'
    end
  end

  def edit; end

  def update
    @plant.update(plant_params)
    redirect_to plant_path(@plant)
  end

  def destroy
    @plant.destroy
    redirect_to root_path
  end

  private

  def set_plant
    @plant = Plant.find(params[:id])
  end

  def plant_params
    params.require(:plant).permit(:common_name, :scientific_name, :family, :image_url, :price, :address)
  end
end
