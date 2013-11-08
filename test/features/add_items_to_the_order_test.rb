require "test_helper"

class AddItemsToTheOrderTest < Capybara::Rails::TestCase
  def setup
    @category = Category.create(name: "Beverages and Drinks")
    @category2 = Category.create(name: "Snacks")
    @item_1 = @category.items.create!(name: "coke", price: 100, description: "tasty!")
    @item_2 = @category.items.create!(name: "pepsi", price: 100, description: "tasty!")
    @category2.items.create!(name: "bagel", price: 100, description: "tasty!")
  end

  def test_it_adds_an_item
    visit categories_path
    within "#category_#{@category.id}" do
      select(4, from: "quantity_item_#{@item_1.id}")
      within "#item_#{@item_1.id}" do
        click_on 'Add to Cart'
      end
    end
    assert page.has_content?("Added 4 cokes to your cart")
  end
end
