class UsersController < ApplicationController
#skip_before_action :authenticate_user!, only: :dashboard

  def dashboard
    @services = current_user.services

  end

  def revenues
    @services = current_user.services

  end

end
