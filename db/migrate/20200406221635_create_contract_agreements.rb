class CreateContractAgreements < ActiveRecord::Migration[5.2]
  def change
    create_table :contract_agreements do |t|
      t.references :users
    end
  end
end
