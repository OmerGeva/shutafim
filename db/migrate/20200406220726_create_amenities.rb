class CreateAmenities < ActiveRecord::Migration[5.2]
  def change
    create_table :amenities do |t|
      t.boolean :wifi
      t.boolean :dishwasher
      t.boolean :laundry_washer
      t.boolean :laundry_dryer
      t.boolean :cats_ok
      t.boolean :dogs_ok
      t.boolean :air_conditioner
    end
  end
end
