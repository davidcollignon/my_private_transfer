class DeleteBeneficiaryReferenceInUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :beneficiary_id
  end
end
