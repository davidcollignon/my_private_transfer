class ServicesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    @service.save
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def service_params
    params.require(:service).permit(:flight_number, :driver_language, :number_normal_luggage, :number_hand_luggage, :number_odd_luggage, :description_odd_luggage, :additional_info, :commission_rate)
  end

end
