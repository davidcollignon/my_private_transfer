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
    @monthly_comm = []
    @monthly_potential_revenue = []
    @monthly_potential_comm = []

    while index <= DateTime.now.month do
      @monthly_revenue << sum_rev(index)
      @monthly_comm << sum_comm(index)
      @monthly_potential_revenue << sum_potential_rev(index)
      @monthly_potential_comm << sum_potential_comm(index)
      index +=1
    end
    @monthly_revenue
    @monthly_comm
    @monthly_potential_revenue
    @monthly_potential_comm



  end

  def sum_rev(month)
    @total_sales = 0
    @services.each do |service|
      if service.pick_up_date.month == month && service.status == "Done"
        @total_sales += (service.final_price_cents / 100)
      end
    end
    @total_sales
  end

  def sum_comm(month)
    @total_comm = 0
    @services.each do |service|
      if service.pick_up_date.month == month && service.status == "Done"
        @total_comm += (service.final_price_cents * service.commission_rate / 100)
      end
    end
    @total_comm
  end

  def sum_potential_rev(month)
    @total_sales = 0
    @services.each do |service|
      if service.pick_up_date.month == month && service.status != "Done"
        @total_sales += (service.final_price_cents / 100)
      end
    end
    @total_sales
  end

  def sum_potential_comm(month)
    @total_comm = 0
    @services.each do |service|
      if service.pick_up_date.month == month && service.status != "Done"
        @total_comm += (service.final_price_cents * service.commission_rate / 100)
      end
    end
    @total_comm
  end

end
