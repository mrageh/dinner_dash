require "test_helper"

class CanAccessMenuTest < Capybara::Rails::TestCase
  def test_it_gets_to_menu_page
    visit categories_path
    assert page.has_content?("Menu")
  end

  def test_it_shows_categories
    visit categories_path
    # within "#cat" do
    # puts category.name
      assert_selector 'li:first', text: "Sandwiches"
      page.must_have_selector 'li:first', text: "Sandwiches"
    # end
    # assert page.has_content?("Beverages")
    # assert page.has_content?("Baked Goods")
    # assert page.has_content?("Sides")
  end
end
