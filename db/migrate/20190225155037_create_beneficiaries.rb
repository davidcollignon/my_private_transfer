class CreateBeneficiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :beneficiaries do |t|
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :language
      t.string :email
      t.string :phone_number

      t.timestamps
    end
  end
end
