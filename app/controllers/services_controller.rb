class ServicesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]


  def index
  end

  def show
    @service = Service.find(params[:id])
  end

  def new
    @car = Car.find(params["car_id"])
    @service = Service.new
  end

  def create
    @car = Car.find(params[:service][:car])
    @hours = params[:service][:number_hours_at_disposal]
    @commission_rate = params[:service][:commission_rate]
    @amount = @car.price_per_hour_cents * @hours.to_i * (1 + @commission_rate.to_f)
    @service = Service.create!(car: @car, final_price: @amount, status: 'pending', user: current_user)
    redirect_to new_service_payment_path(@service)
  end

  def edit

    @service = Service.find(params[:id])
  end

  def update

    @service = Service.find(params[:id])
    if @service.update(service_params)
    redirect_to edit_service_path(@service)
    else
      render :edit
    end
  end

  def destroy
    @service = Service.find(params[:id])
    @service.delete
    redirect_to root_path
  end

  private

  def service_params
    #params.require(:service).permit(:flight_number, :number_hours_at_disposal, :number_of_passengers, :number_normal_luggage, :number_hand_luggage, :number_odd_luggage, :description_odd_luggage, :additional_info, :commission_rate, :car, :user, :pick_up_date, :final_price, :status, :payment, :driver_language, :service_type, :pick_up_address, :destination_address)
  params.permit(:data)
  end
end
