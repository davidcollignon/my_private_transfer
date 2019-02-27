class PaymentsController < ApplicationController
    before_action :set_service

  def new
  end

  def create
  end

private

  def set_service
    @service = current_user.services.where(status: 'pending').find(params[:service_id])
  end
end
