class CreateOpenHouseAppts < ActiveRecord::Migration[5.2]
  def change
    create_table :open_house_appts do |t|
      t.boolean :checked_in
      t.time :time_entered
      t.time :time_left
      t.references :user, foreign_key: true
      t.references :open_house, foreign_key: true

      t.timestamps
    end
  end
end
