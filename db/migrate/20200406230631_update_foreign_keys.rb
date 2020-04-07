class UpdateForeignKeys < ActiveRecord::Migration[5.2]
  def change
    add_reference :listings, :apartments, foreign_key: true
    add_reference :listings, :contract_agreements, foreign_key: true
    add_reference :apartments, :cities, foreign_key: true
    add_reference :apartments, :amenities, foreign_key: true
    add_reference :cities, :neighborhoods, foreign_key: true
    add_reference :users, :profiles, foreign_key: true
  end
end
