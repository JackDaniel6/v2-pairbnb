class AddPhotosToListings < ActiveRecord::Migration
  def change
    add_column :listings, :photos, :text, array:true, default: []
end
