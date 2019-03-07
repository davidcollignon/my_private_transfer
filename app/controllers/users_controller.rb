class UsersController < ApplicationController
#skip_before_action :authenticate_user!, only: :dashboard

  def dashboard
    @services = current_user.services
    @confirmed_services = @services.where(status: ["paid", "Paid", "done", "Done"])
  end

  def revenues
    @services = current_user.services
    @confirmed_services = @services.where(status: ["paid", "done"])
    @delivered_services = @services.where(status: ["done"])
    @pending_delivery_services = @services.where(status: ["paid"])
  end

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

    index = 1
    @monthly_revenue = []
    @monthly_comm = []

    # uncomment if you want to include "pending revenue tab" in the agent dashboard
    # @monthly_potential_revenue = []
    # @monthly_potential_comm = []

    while index <= DateTime.now.month do
      @monthly_revenue << sum_rev(index)
      @monthly_comm << sum_comm(index)

      # uncomment if you want to include "pending revenue tab" in the agent dashboard
      # @monthly_potential_revenue << sum_potential_rev(index)
      # @monthly_potential_comm << sum_potential_comm(index)
      index +=1
    end
    @monthly_revenue
    @monthly_comm

    # uncomment if you want to include "pending revenue tab" in the agent dashboard
    # @monthly_potential_revenue
    # @monthly_potential_comm

  end

  def sum_rev(month)
    @total_sales = 0
    @delivered_services.each do |service|
      if service.pick_up_date.month == month
        @total_sales += (service.final_price / 100)
      end
    end
    @total_sales
  end

  def sum_comm(month)
    @total_comm = 0
    @delivered_services.each do |service|
      if service.pick_up_date.month == month
        @total_comm += (service.final_price / 100 * service.commission_rate / 100)
      end
    end
    @total_comm
  end

  # this part is only if we want to display the "pending revenues tab" in the agent dashboard

  # def sum_potential_rev(month)
  #   @total_sales = 0
  #   @confirmed_services.each do |service|
  #     if service.pick_up_date.month == month && service.status != ("Done" || "done")
  #       @total_sales += (service.final_price_cents / 100)
  #     end
  #   end
  #   @total_sales
  # end

  # def sum_potential_comm(month)
  #   @total_comm = 0
  #   @confirmed_services.each do |service|
  #     if service.pick_up_date.month == month && service.status != ("Done" || "done")
  #       @total_comm += (service.final_price_cents * service.commission_rate / 100)
  #     end
  #   end
  #   @total_comm
  # end

end
