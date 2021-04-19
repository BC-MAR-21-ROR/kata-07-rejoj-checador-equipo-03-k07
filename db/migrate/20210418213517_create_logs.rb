class CreateLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :logs do |t|
      t.datetime :check_in
      t.datetime :check_out
      t.references :employee, null: false, foreign_key: true
    end
  end
end
