class ChangeCommissionRateFromService < ActiveRecord::Migration[5.2]
  def change
    change_column :services, :commission_rate, :float, :default => 0
  end
end
