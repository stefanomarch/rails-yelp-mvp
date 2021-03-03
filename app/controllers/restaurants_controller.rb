class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [:show, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show; end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    if @restaurant.save
      redirect_to restaurant_path(@restaurant.id)
    else
      render :new
    end
  end

  def destroy
    @restaurant.destroy

    redirect_to :root
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :rating, :category, :reviews)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
