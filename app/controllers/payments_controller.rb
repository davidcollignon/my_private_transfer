class PaymentsController < ApplicationController
    before_action :set_service


  def new
    @service = Service.find(params[:service_id])
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
    currency:     @service.final_price.currency
  )

  @service.update(payment: charge.to_json, status: 'paid')
  send_invoice_email
  redirect_to service_path(@service)
  end

private

  def set_service
    @service = current_user.services.where(status: 'pending').find(params[:service_id])
  end

    private

  def send_invoice_email
    PaymentMailer.creation_confirmation(@service).deliver_now
  end
end
