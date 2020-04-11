class UpdateListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :price, :integer
    add_column :listings, :duration, :integer

    remove_column :listings, :bathrooms
    remove_column :listings, :bedrooms
    remove_column :listings, :total_rooms
    remove_column :listings, :address
  end
end
