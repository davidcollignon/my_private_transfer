class AddStateToService < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :state, :string
  end
end
