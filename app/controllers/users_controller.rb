class UsersController < ApplicationController
#skip_before_action :authenticate_user!, only: :dashboard

  def dashboard
    @services = current_user.services

  end

  def revenues
    @services = current_user.services
    @months_hash = { 1 => "January",
                     2 => "February",
                     3 => "March",
                     4 => "April",
                     5 => "May",
                     6 => "June",
                     7 => "July",
                     8 => "August",
                     9 => "September",
                     10 => "October",
                     11 => "November",
                     12 => "December"}

    @total_sales = @services.reduce(0) { |sum, service|
      sum + service.final_price_cents
    }

  end

  private

  def sum_rev_month

  end

end
