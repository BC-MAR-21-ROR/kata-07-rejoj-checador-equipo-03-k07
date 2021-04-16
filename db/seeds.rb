# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# rails -T db           # => I can see every task for database
# rails db:seed:replant # =>
# The difference with db:reset you can execute with server running, because delete registre not database and run seeds
# rails db:truncate_all # =>
# The difference with db:destroy you can execute with server running because delete registre not database

Admin.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

3.times do |number|
  CompanyBranch.create!(
    name: "Branch#{number}",
    address: "Address#{number}",
    admin_id: Admin.first.id
  )
end

CompanyBranch.all.each do |company_branch|
  number = Random.rand(1..100)
  Employee.create!(
    name: "Employee#{number}",
    email: "email#{number}",
    position: "position#{number}",
    private_number: number,
    company_branch_id: company_branch.id
  )
end
