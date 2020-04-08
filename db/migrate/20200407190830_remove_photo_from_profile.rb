class RemovePhotoFromProfile < ActiveRecord::Migration[5.2]
  def change
    remove_column :profiles, :photo
  end
end
