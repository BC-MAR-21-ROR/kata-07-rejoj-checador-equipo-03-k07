require 'rails_helper'

RSpec.describe 'reports', type: :system do
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

  it 'Index page without results' do
    visit reports_path
    expect(page).to have_content('No results for this report')
  end

  it 'Index page with results' do
    FactoryBot.create_list(:log , 10, check_in: Date.yesterday)
    visit reports_path
    expect(page).to have_selector('table tbody tr', count: 10)
  end
end
