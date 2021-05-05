# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'New Employee', type: :system do
  before do
    driven_by(:selenium)
  end

  let(:admin) do
    FactoryBot.create(:admin)
  end

  let(:company_branch) do
    FactoryBot.create(:company_branch)
  end

  let(:employee) do
    FactoryBot.create(:employee, company_branch: company_branch)
  end

  before do
    login(as: admin)
  end

  it 'index page' do
    FactoryBot.create_list(:employee, 5, company_branch: company_branch)
    visit company_branch_employees_path(company_branch)
    expect(page).to have_selector('table tbody tr', count: 5)
  end

  it 'show employee' do
    visit company_branch_employee_path(company_branch, employee)
    expect(page).to have_content(employee.email)
    expect(page).to have_content(employee.name)
    expect(page).to have_content(employee.position)
    expect(page).to have_content(employee.employee_number)
    expect(page).to have_content(employee.private_number)
  end

  it 'created correctly' do
    visit new_company_branch_employee_path(company_branch)

    fill_in 'employee_name', with: 'Draxton Simmons'
    fill_in 'employee_email', with: 'drax@email.com'
    fill_in 'employee_position', with: 'manager'

    click_on 'Save'
    expect(page).to have_content('Your employee has been created')
  end

  it 'created fail' do
    visit new_company_branch_employee_path(company_branch)

    fill_in 'employee_email', with: 'drax@email.com'
    fill_in 'employee_position', with: 'manager'

    click_on 'Save'
    expect(page).to have_content("can't be blank")
  end

  it 'Update employee' do
    visit edit_company_branch_employee_path(company_branch, employee)

    fill_in 'employee_name', with: 'Draxton Simmons'
    fill_in 'employee_email', with: 'drax@email.com'
    fill_in 'employee_position', with: 'manager'

    click_on 'Save'
    expect(page).to have_content('Your employee has been updated')
  end

  it 'Update employee fail' do
    visit edit_company_branch_employee_path(company_branch, employee)

    fill_in 'employee_name', with: ''

    click_on 'Save'
    expect(page).to have_content("Your employee couldn't be updated")
  end

  it 'change state success', js: true do
    employee = FactoryBot.create(:employee, company_branch: company_branch, state: false)
    visit company_branch_employees_path(company_branch)

    accept_alert do
      find(%(#switch-#{employee.id})).click
    end
    expect(page).to have_content(%(Employee "#{employee.name}" has been enabled))
  end
end
