class AttractionsController < ApplicationController
  before_action :find_attr, only: [:show, :edit, :update]
  before_action :require_admin, only: [:edit, :update]
  
  def index
    @attractions = Attraction.all
  end 
  
  def new 
    @attraction = Attraction.new
  end 
  
  def create 
    @attraction = Attraction.new(attr_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render :new
    end
  end
  
  
  def show
  end 
  
  def edit
  end
  
  def update
    @attraction = Attraction.update(attr_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render :edit
    end 
  end 
  
  
  private
  
  def find_attr
    @attraction = Attraction.find_by(id: params[:id])
  end 
  
  def attr_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end 
end
