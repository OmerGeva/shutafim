class ChangeUsersDobDataTypeToDate < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :dobb, :date

    remove_column :users, :dob

    rename_column :users, :dobb, :dob
  end
end
