require "test_helper"

class ShoppingCartTest < Capybara::Rails::TestCase
  def test_it_gets_to_cart_page
    visit orders_path
    assert page.has_content?("Your Order")
  end

  # def test_it_shows_categories
  #   skip
  #   Category.create(name: "Beverages")

  #   visit categories_path
  #   save_and_open_page
  #   within "#menu" do
  #     assert page.has_content?("Beverages")
  #   end
  # end

end
