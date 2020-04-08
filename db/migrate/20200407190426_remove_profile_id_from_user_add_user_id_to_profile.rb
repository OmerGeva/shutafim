class RemoveProfileIdFromUserAddUserIdToProfile < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :profile_id

    add_reference :profiles, :user, index: true
  end
end
