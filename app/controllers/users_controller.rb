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

    # @total_sales = @services.reduce(0) { |sum, service|
    #   sum + service.final_price_cents
    # }
    #
    index = 1
    @monthly_revenue = []
    @monthly_revenue << -1

    while index < DateTime.now.month + 1 do
      @monthly_revenue << sum_rev(index)
    end



  end

  def sum_rev(month)
    @total_sales = 0
    @services.each do |service|
      if service.pick_up_date.month == month
        @total_sales += service.final_price_cents
      end
    end
    @total_sales
  end
end
