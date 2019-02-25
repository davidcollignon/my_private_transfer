class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :beneficiary, foreign_key: true
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :agency, :string
    add_column :users, :agency_address, :string
  end
end
