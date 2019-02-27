class DeletePricePerHourPricePerKmAndAddNewPriceColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :cars, :price_per_km
    remove_column :cars, :price_per_hour
    add_monetize :cars, :price_per_km, currency: {present: false}
    add_monetize :cars, :price_per_hour, currency: {present: false}
  end
end
