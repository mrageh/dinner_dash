require "test_helper"

class CanLoginTest < Capybara::Rails::TestCase
  def test_can_visit_login_page
    visit new_session_path
    assert page.has_content?("Login")
  end

  def test_login_form_can_be_filled_in
    visit new_session_path
    save_and_open_page
    fill_in "session_username", with: "Melanie"
    fill_in "session_password", with: "123456"
  end
end
