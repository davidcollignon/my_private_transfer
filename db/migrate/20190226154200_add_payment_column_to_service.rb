class AddPaymentColumnToService < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :payment, :jsonb
  end
end
