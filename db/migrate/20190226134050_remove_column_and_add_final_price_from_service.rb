class RemoveColumnAndAddFinalPriceFromService < ActiveRecord::Migration[5.2]
  def change
    remove_column :services, :final_price
    add_monetize :services, :final_price, currency: { present: false }
  end
end
