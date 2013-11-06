require "test_helper"

class CanAccessItemsPageTest < Capybara::Rails::TestCase
  def test_it_views_items_page
    visit items_path
    click_link "New Item"
    fill_in "title", :with => "YO MAMA!"ra
    click_on "Save Item"
    assert page.has_content?("YO MAMA!")
  end
end
