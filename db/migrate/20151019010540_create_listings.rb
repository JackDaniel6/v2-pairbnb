class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.references :country, index: true
      t.references :user, index: true
      t.string :title
      t.text :description
      t.integer :max_guests

      t.timestamps null: false
    end
  end
end
