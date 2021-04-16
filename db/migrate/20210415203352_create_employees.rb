class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.string :position
      t.integer :private_number
      t.references :company_branch, null: false, foreign_key: true

      t.timestamps
    end
  end
end
