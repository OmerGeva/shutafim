class UpdateUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :dob, :integer

    remove_column :users, :profession
    remove_column :users, :about_me
    remove_column :users, :age

  end
end
