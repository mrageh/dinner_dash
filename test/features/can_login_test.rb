require "test_helper"

class CanLoginTest < Capybara::Rails::TestCase
  def test_can_visit_login_page
    visit new_session_path
    assert page.has_content?("Login")
  end

  def test_login_form_can_be_filled_in
    visit new_session_path
    fill_in "session[username]", with: "Melanie"
    fill_in "session[password]", with: "123456"
  end

  def test_login_form_can_be_submitted
    visit new_session_path
    fill_in "session[username]", with: "Melanie"
    fill_in "session[password]", with: "123456"
    click_button('Login')
  end
end
