class CreateAvailableDates < ActiveRecord::Migration
  def change
    create_table :available_dates do |t|
      t.references :listing, index: true
      t.date :date

      t.timestamps null: false
    end
  end
end
