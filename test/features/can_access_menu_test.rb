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
    within "#menu" do
      assert page.has_content?("Beverages")
    end
  end

  def test_it_diplays_all_items_for_each_category
    visit categories_path
    within "#menu" do
      within "#cat_name" do
        assert page.has_content?()
      end
    end
  end

end
