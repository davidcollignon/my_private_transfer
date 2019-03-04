class CarsController < ApplicationController
skip_before_action :authenticate_user!, only: [:index, :show, :new]

  def index
    @cars = Car.all

    session[:param_home] = {
                            :departure => params[:departure],
                            :hours => params[:hours],
                            :pick_up_date => params[:pick_up_date]}
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
      if @car.save
        redirect_to car_path(@car)
      else
        render :new
      end
  end

  def update
    @car = Car.find(params[:id])
    @car.update(car_params)
    redirect_to cars_path
  end

  def destroy
    @car = Car.find params[:id]
    @car.delete
    redirect_to cars_path
  end


  def car_params
    params.require(:car).permit(:company, :brand, :description, :luggage_capacity, :price_per_hour, :price_per_hour, :price_per_km, :image, :image_cache)
  end

end
