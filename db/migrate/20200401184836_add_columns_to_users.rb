class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone_number, :int
    add_column :users, :age, :int
    add_column :users, :profession, :string
    add_column :users, :about_me, :text
  end
end
