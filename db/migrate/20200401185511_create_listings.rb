class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.integer :bathrooms
      t.integer :bedrooms
      t.integer :total_rooms
      t.string :address
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
