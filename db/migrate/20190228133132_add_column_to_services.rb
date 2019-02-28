class AddColumnToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :title, :string
    add_column :services, :first_name, :string
    add_column :services, :last_name, :string
    add_column :services, :email, :string
    add_column :services, :mobile, :string
  end
end
