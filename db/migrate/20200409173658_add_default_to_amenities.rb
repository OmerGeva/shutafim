class AddDefaultToAmenities < ActiveRecord::Migration[5.2]
  def change
    change_column :amenities, :wifi, :boolean, default: false
    change_column :amenities, :dishwasher, :boolean, default: false
    change_column :amenities, :laundry_washer, :boolean, default: false
    change_column :amenities, :laundry_dryer, :boolean, default: false
    change_column :amenities, :cats_ok, :boolean, default: false
    change_column :amenities, :dogs_ok, :boolean, default: false
    change_column :amenities, :air_conditioner, :boolean, default: false
  end
end
