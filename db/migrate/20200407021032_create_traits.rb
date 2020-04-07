class CreateTraits < ActiveRecord::Migration[5.2]
  def change
    create_table :traits do |t|
      t.boolean :smokes
      t.boolean :has_cat
      t.boolean :has_dog
      t.boolean :veg
    end
  end
end
