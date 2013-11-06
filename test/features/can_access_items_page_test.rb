require "test_helper"

class CanAccessItemsPageTest < Capybara::Rails::TestCase
  def test_it_views_items_page
    visit items_path
    assert  page.has_content?("All items"g)
  end
end
