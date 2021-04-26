# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# rails -T db           # => I can see every task for database
# rails db:seed:replant # =>
# The difference with db:reset you can execute with server running, because delete registre not database and run seeds
# rails db:truncate_all # =>
# The difference with db:destroy you can execute with server running because delete registre not database

admin = FactoryBot.create(:admin, email: 'admin@example.com', password: 'password', password_confirmation: 'password')
puts '...🍻...🍻...admin created!!'

company_branches = FactoryBot.create_list(:company_branch, 10, admin: admin)
puts '...🍻...🍻...company_branches created!!'

company_branches.each { |company| FactoryBot.create_list(:employee, 10, company_branch: company) }
puts '...🍻...🍻...employees created!!'

def create_logs_for(employees, dates)
  employees.each do |employee|
    dates.take(rand(20..44)).each do |day|
      FactoryBot.create(:log, check_in: day, employee: employee)
    end
    print '.'
  end
  puts "\n 🍻...🍻...employees logs created!!"
end

employees_all = Employee.all
# Array of dates since 2 months (only Mon--Fri)
dates = (2.months.ago.to_date..Date.today).select(&:on_weekday?)
thr = []
thr << Thread.new { create_logs_for(employees_all[0..25], dates) }
thr << Thread.new { create_logs_for(employees_all[26..50], dates) }
thr << Thread.new { create_logs_for(employees_all[51..75], dates) }
thr << Thread.new { create_logs_for(employees_all[76..100], dates) }
thr.each(&:join)
