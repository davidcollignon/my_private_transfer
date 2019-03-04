class ServicesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]


  def index
  end

  def show
    @service = current_user.services.where(status: 'paid').find(params[:id])
  end

  def new
    @car = Car.find(params[:car_id])
    @service = Service.new
  end

  def create
    @car = Car.find(params[:service][:car])
    # @hours = params[:service][:number_hours_at_disposal]
    @hours = session[:param_home]["hours"]
    @commission_rate = params[:service][:commission_rate]
    @amount = @car.price_per_hour_cents * @hours.to_i * (1 + (@commission_rate.to_f) / 100)
    @service = Service.new(service_params)
    @service.car = @car
    @service.final_price = @amount
    @service.status = "pending"
    @service.user = current_user
    @service.pick_up_address = session[:param_home]["departure"]
    @service.pick_up_date = session[:param_home]["pick_up_date"]
    @service.number_hours_at_disposal = @hours

    if @service.save
      redirect_to new_service_payment_path(@service)
    else
      render :new
    end

  end

  def edit
    @service = Service.find(params[:id])
    @hours = @service.number_hours_at_disposal
    @service.number_hours_at_disposal = @hours.to_i
    @service.car
  end

  def update
    @service = Service.find(params[:id])
    @car = @service.car
    @hours = params[:service][:number_hours_at_disposal]
    @commission_rate = params[:service][:commission_rate]
    @amount = @car.price_per_hour_cents * @hours.to_i * (1 + (@commission_rate.to_f) / 100)
    @service = Service.find(params[:id])
    @service.car = @car
    @service.final_price = @amount
    @service.status = "pending"
    @service.user = current_user
    if @service.update(service_params)
    redirect_to new_service_payment_path(@service)
    else
      render :edit
    end
  end

  def destroy
    @service = Service.find(params[:id])
    @service.car
    @service.delete
    redirect_to root_path
  end

  private

  def service_params
  params.require(:service).permit(:final_price, :flight_number, :driver_language, :number_hours_at_disposal, :number_of_passengers, :number_normal_luggage, :number_hand_luggage, :number_odd_luggage, :description_odd_luggage, :additional_info, :commission_rate, :title, :first_name, :last_name, :email, :mobile, :status)
  end
end
