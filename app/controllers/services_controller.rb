class ServicesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show, :new, :create]

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
    @service = Service.new(service_params)
    @service.car = Car.find(params[:car_id])
    @service.save
    redirect_to car_service_path
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
