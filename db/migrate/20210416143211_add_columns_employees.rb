class AddColumnsEmployees < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :state, :boolean, { default: true }
  end
end
