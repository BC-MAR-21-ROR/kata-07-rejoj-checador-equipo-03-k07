require 'rails_helper'

RSpec.describe 'Logout', type: :system do
  before do
    driven_by(:rack_test)
  end

  let :admin do
    FactoryBot.create(:admin)
  end

  it 'destroy session when clicking in log out button' do
    login(as: admin)
    logout
    expect(page).to have_content('You need to sign in before continuing')
  end
end
