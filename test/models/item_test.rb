require 'test_helper'

class ItemTest < ActiveSupport::TestCase

  test "should not save item without description" do
    item = items(:three)
    refute item.save
  end

  test "should not save item without name" do
    item = items(:three)
    refute item.save
  end
end
#dsfg
