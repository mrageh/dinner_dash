require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "should not be created without name" do
    category = Category.new
    refute category.save  
  end
end
