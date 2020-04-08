class RemoveNeighborhoodIdFromCity < ActiveRecord::Migration[5.2]
  def change
    remove_column :cities, :neighborhood_id

    add_reference :neighborhoods, :city, index: true
  end
end
