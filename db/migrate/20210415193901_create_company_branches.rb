class CreateCompanyBranches < ActiveRecord::Migration[6.1]
  def change
    create_table :company_branches do |t|
      t.string :name
      t.string :address
      t.references :admin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
