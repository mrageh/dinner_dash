require "test_helper"

class CanAccessMenuTest < Capybara::Rails::TestCase
  def test_it_gets_to_menu_page
    visit categories_path
    assert page.has_content?("Menu")
  end

  def test_it_shows_categories
    Category.create(name: "Beverages")

    visit categories_path
    within "#menu" do
      assert page.has_content?("Beverages")
    end
  end

  def test_it_diplays_all_items_for_each_category
    category = Category.create(name: "Beverages and Drinks")
    category2 = Category.create(name: "Snacks")
    category.items.create!(name: "coke", price: 100, description: "tasty!")
    category2.items.create!(name: "bagel", price: 100, description: "tasty!")
    visit categories_path
    within "#menu" do
      within "#category_#{category.id}" do
        assert page.has_content?("coke")
      end
    end
  end

  def test_it_shows_categories
    Category.create(name: "Beverages")

    visit categories_path
    within "#menu" do
      assert page.has_content?("Beverages")
    end
  end



end
