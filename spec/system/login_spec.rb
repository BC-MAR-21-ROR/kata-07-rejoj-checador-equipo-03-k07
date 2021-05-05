require 'rails_helper'

RSpec.describe 'Login', type: :system do
  before do
    driven_by(:rack_test)
  end

  let :admin do
    FactoryBot.create(:admin)
  end

  it "fails when user doesn't exist" do
    login(email: 'capybaraerror@example.com', password: 'password')

    expect(page).to have_content('Invalid Email or password')
  end

  it 'success with valid admin credentials' do
    login(as: admin)
    expect(page).to have_content('Signed in successfully')
  end
end
