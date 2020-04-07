class UpdateForeignKeys < ActiveRecord::Migration[5.2]
  def change
    add_reference :listings, :apartment, foreign_key: true
    add_reference :listings, :contract_agreement, foreign_key: true
    add_reference :apartments, :city, foreign_key: true
    add_reference :apartments, :amenity, foreign_key: true
    add_reference :cities, :neighborhood, foreign_key: true
    add_reference :users, :profile, foreign_key: true
  end
end
