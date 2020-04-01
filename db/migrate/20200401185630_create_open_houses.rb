class CreateOpenHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :open_houses do |t|
      t.date :date
      t.time :time
      t.references :listing, foreign_key: true

      t.timestamps
    end
  end
end
