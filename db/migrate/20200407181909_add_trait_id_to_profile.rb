class AddTraitIdToProfile < ActiveRecord::Migration[5.2]
  def change
    add_reference :profiles, :trait, index: true
  end
end
