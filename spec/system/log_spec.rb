# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'logs', type: :system do
  before do
    driven_by(:selenium)
  end

  let(:company_branch) do
    FactoryBot.create(:company_branch)
  end

  let(:employee) do
    FactoryBot.create(:employee, company_branch: company_branch)
  end

  it 'check_in success' do
    visit check_in_path
    fill_in 'private_number', with: employee.private_number
    click_on 'check_in'
    expect(page).to have_content('Employee check_in success')
  end

  it 'check_in fail' do
    visit check_in_path
    fill_in 'private_number', with: ''
    click_on 'check_in'
    expect(page).to have_content('Invalid private number')
  end

  it 'check_out success' do
    FactoryBot.create(:log, employee: employee, check_in: Date.today, check_out: nil)
    visit check_out_path
    fill_in 'private_number', with: employee.private_number
    click_on 'check_out'
    expect(page).to have_content('Employee check_out success')
  end

  it 'check_out fail' do
    visit check_out_path
    fill_in 'private_number', with: employee.private_number
    click_on 'check_out'
    expect(page).to have_content('Must check_in first')
  end
end
