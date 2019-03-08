class ServicesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:show, :confirm, :confirm_update, :rating, :rating_update]


  def index
  end

  def show
    @service = current_user.services.where(status: 'paid').find(params[:id])
    @car = @service.car
    @hours = @service.number_hours_at_disposal
    @commission_rate = @service.commission_rate
    @amount = @car.price_per_hour_cents * @hours.to_i * (1 + (@commission_rate.to_f) / 100)
    @service.car = @car
    @service.user = current_user
    @service.final_price = @amount
  end


  def new
    @car = Car.find(params[:car_id])
     session[:param_car] = params[:car_id]

    @service = Service.new
  end

  def create
    @car = Car.find(session["param_car"])
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
    @service.car = @car
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

  def confirm
    @service = Service.find(params[:id])
  end

  def confirm_update
   @service = Service.find(params[:id])
    if @service.update(service_params)
      flash[:notice] = "Transfer added"
      ServiceMailer.rating_mail(@service).deliver_now
      redirect_to confirm_service_path
    else
      redirect_to confirm_service_path
    end
  end


  def rating
    @service = Service.find(params[:id])
  end

  def rating_update
   @service = Service.find(params[:id])
    if @service.update(service_params)
      flash[:notice] = "Thanks for your rating"
      redirect_to rating_service_path
    else
      redirect_to rating_service_path
    end
  end

  def send_invoice_email_client
    @service = Service.find(params[:id])
    PaymentMailer.creation_confirmation_client(@service).deliver_now
    render :show
  end

  private

  def service_params
    params.require(:service).permit(:final_price, :flight_number, :driver_language, :number_hours_at_disposal, :number_of_passengers, :number_normal_luggage, :number_hand_luggage, :number_odd_luggage, :description_odd_luggage, :additional_info, :commission_rate, :title, :first_name, :last_name, :email, :mobile, :status, :rating, :pick_up_date, :pick_up_address)
  end
end
