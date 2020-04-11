class AddNameToApartments < ActiveRecord::Migration[5.2]
  def change
    add_column :apartments, :name, :string
  end
end
