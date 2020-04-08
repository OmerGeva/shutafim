class CreateApartments < ActiveRecord::Migration[5.2]
  def change
    create_table :apartments do |t|
      t.integer :bedrooms
      t.integer :bathrooms
      t.integer :total_rooms
      t.string :description
      t.string :type
      t.string :street_address
    end
  end
end
