require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  
  test "should not save item without description" do
    item = Item.new(name: "taco")
    refute item.save
  end

  test "should not save item without name" do
    item = Item.new(description: "spicy taco")
    refute item.save
  end
end
