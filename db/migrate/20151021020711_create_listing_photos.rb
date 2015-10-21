class CreateListingPhotos < ActiveRecord::Migration
  def change
    create_table :listing_photos do |t|
      t.references :listing, index: true
      t.string :photo
      
      t.timestamps null: false
    end
  end
end
