require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @category = Category.create(name: "sports")
  end

  test "index" do
    get categories_path
    assert_response :success
  end

  test "new" do
    get new_category_path
    assert_response :success
  end

  test "show" do
    get category_path(@category)
    assert_response :success
  end

end
