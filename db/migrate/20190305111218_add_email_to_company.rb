class AddEmailToCompany < ActiveRecord::Migration[5.2]
  def change
      add_column :companies, :email, :string
  end
end
