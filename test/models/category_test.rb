require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

def setup
  @category = Category.new(name: "sports")

end

  test "category should be valid" do

    assert @category.valid?   #Agr true ho to pass ho jana chahiye
  end

  test "name should be present" do

    @category.name = " "
    assert_not @category.valid? #Agr true ho to pass ni hna chahiye cz assert_not is espectiing false
  end

  test "name should be unique" do
    @category.save
    category2 = Category.new(name: "sports")
    assert_not category2.valid?

  end

  test "name should not be too long" do
    @category.name = "a" * 26
    assert_not @category.valid?
  end

  test "name should not be to short" do
    @category.name = "aa"
     assert_not @category.valid?

  end

end
