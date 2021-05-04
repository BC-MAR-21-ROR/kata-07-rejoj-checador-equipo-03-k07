# Provides authentication helper methods for system tests
module CapybaraAuthenticationHelper
  def login(as: nil, email: nil, password: nil)
    visit new_admin_session_path

    fill_in 'Email',    with: email    || as&.email
    fill_in 'Password', with: password || as&.password

    click_on :commit
  end

  def logout
    click_on 'Sign out'
  end
end
