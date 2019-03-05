class ChangeAdditionalInformationColumnInService < ActiveRecord::Migration[5.2]
  def change
    change_column :services, :additional_info, :text
  end
end
