class PaymentsController < ApplicationController
    before_action :set_service

  def new
    @service = Service.find(params[:service_id])
    @car = @service.car
    @hours = @service.number_hours_at_disposal
    @commission_rate = @service.commission_rate
    @amount = @car.price_per_hour_cents * @hours.to_i * (1 + (@commission_rate.to_f) / 100)
    @service.car = @car
    @service.user = current_user
    @service.final_price = @amount
  end

  def create
    customer = Stripe::Customer.create(
    source: params[:stripeToken],
    email:  params[:stripeEmail]
  )

  charge = Stripe::Charge.create(
    customer:     customer.id,# You should store this customer id and re-use it.
    amount:       @service.final_price_cents,
    description:  "Payment for your service confirmed",
    currency:     @service.final_price.currency,
    receipt_email: @service.user.email
  )
  @service.update(payment: charge.to_json, status: 'paid')
  ServiceMailer.transfer_confirmation(@service).deliver_now
  redirect_to service_path(@service)
  end

private

  def set_service
    @service = current_user.services.where(status: 'pending').find(params[:service_id])
  end

  def send_invoice_email_agent
    PaymentMailer.creation_confirmation_agent(@service).deliver_now
  end
end
