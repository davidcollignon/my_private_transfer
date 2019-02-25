class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.references :company, foreign_key: true
      t.string :brand
      t.text :description
      t.integer :passenger_capacity
      t.integer :luggage_capacity
      t.float :price_per_hour
      t.float :price_per_km
      t.string :image

      t.timestamps
    end
  end
end
