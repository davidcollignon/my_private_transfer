class ChangeDefaultBehaviorOfLuggageCommissionLanguageService < ActiveRecord::Migration[5.2]
  def change
    change_column :services, :driver_language, :string, default: "English"
    change_column :services, :number_normal_luggage, :integer, default: 0
    change_column :services, :number_normal_luggage, :integer, default: 0
    change_column :services, :number_hand_luggage, :integer, default: 0
    change_column :services, :number_odd_luggage, :integer, default: 0
    change_column :services, :commission_rate, :float, default: 0
  end
end
