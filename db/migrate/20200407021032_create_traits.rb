class CreateTraits < ActiveRecord::Migration[5.2]
  def change
    create_table :traits do |t|
      t.boolean :smokes, default: false
      t.boolean :has_cat, default: false
      t.boolean :has_dog, default: false
      t.boolean :veg, default: false
    end
  end
end
