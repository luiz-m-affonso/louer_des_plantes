class PlantsController < ApplicationController
  before_action :set_plant, only: [:show, :edit, :update, :destroy]
  def index
    @plants = policy_scope(Plant).order(created_at: :desc)
  end

  def show
    authorize @plant
  end

  def new
    authorize @plant
    @plant = Plant.new
  end

  def create
    authorize @plant
    @plant = Plant.create(plant_params)
    if @plant.save
      redirect_to plant_path(@plant)
    else
      render 'new'
    end
  end

  def edit
    authorize @plant
  end

  def update
    authorize @plant
    @plant.update(plant_params)
    redirect_to plant_path(@plant)
  end

  def destroy
    authorize @plant
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
