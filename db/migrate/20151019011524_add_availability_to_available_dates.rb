class AddAvailabilityToAvailableDates < ActiveRecord::Migration
  def change
    add_column :available_dates, :availability, :boolean
  end
end
