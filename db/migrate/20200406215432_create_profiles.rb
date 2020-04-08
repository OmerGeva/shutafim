class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :profession
      t.string :about_me
      t.string :gender
      t.string :photo
    end
  end
end
