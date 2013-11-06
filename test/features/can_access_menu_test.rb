require "test_helper"

class CanAccessMenuTest < Capybara::Rails::TestCase
  def test_it_gets_to_menu_page
    visit categories_path
    assert page.has_content?("Menu")
  end

  def test_it_shows_categories
    Category.create(name: "Beverages")

    visit categories_path
    save_and_open_page
    within "#cat" do
      assert page.has_content?("Beverages")
    end

     # assert_selector 'li:first', text: "Sandwiches"
     #  page.must_have_selector 'li:first', text: "Sandwiches"
  end
end
