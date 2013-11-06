require "test_helper"

class CanAccessItemsPageTest < Capybara::Rails::TestCase
  test "it views items page" do
    visit items_path
    assert_content page, "All items"
    refute_content page, "Goobye All!"
  end
end
