class ServicesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]


  def index
  end

  def show
    @service = Service.find(params[:id])
  end

  def new
    @car = Car.find(params[:car_id])
    @service = Service.new
  end

  def create
    @car = Car.find(params[:service][:car])
    @service = Service.create!(car: @car, final_price: @car.price_per_hour_cents, status: 'pending', user: current_user)
    redirect_to new_service_payment_path(@service)
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
    @service.update
  end

  def destroy
    @service = Service.find(params[:id])
    @service.delete
    redirect_to root_path
  end

  private

  def service_params
    params.require(:service).permit(:flight_number, :number_of_passengers, :number_normal_luggage, :number_hand_luggage, :number_odd_luggage, :description_odd_luggage, :additional_info, :commission_rate)
  end
end
