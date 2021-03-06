class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.references :car, foreign_key: true
      t.references :user, foreign_key: true
      t.references :beneficiary, foreign_key: true
      t.datetime :pick_up_date
      t.float :final_price
      t.string :status
      t.string :flight_number
      t.integer :number_of_passengers
      t.integer :number_normal_luggage
      t.integer :number_odd_luggage
      t.text :description_odd_luggage
      t.integer :number_hand_luggage
      t.string :additional_info
      t.float :commission_rate
      t.string :service_type
      t.string :pick_up_address
      t.string :destination_address
      t.float :number_hours_at_disposal

      t.timestamps
    end
  end
end

