class PaymentsController < ApplicationController
    before_action :set_service

  def new
    @service = Service.find(params[:service_id])
  end

  def create
    redirect_to service_path(@service)
  end

private

  def set_service
    @service = current_user.services.where(status: 'pending').find(params[:service_id])
  end
end
