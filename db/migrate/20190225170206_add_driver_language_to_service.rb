class AddDriverLanguageToService < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :driver_language, :string
  end
end
