class ChangeEmployeePrivateNumberType < ActiveRecord::Migration[6.1]
  def change
    change_column :employees, :private_number, :string
    add_index :employees, :private_number, unique: true
  end
end
