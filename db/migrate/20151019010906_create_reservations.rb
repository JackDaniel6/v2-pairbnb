class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :listing, index: true
      t.references :user, index: true
      t.date :start_date
      t.date :end_date
      t.integer :num_guests

      t.timestamps null: false
    end
  end
end
