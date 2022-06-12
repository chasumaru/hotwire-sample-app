require "test_helper"

class BearsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bear = bears(:one)
  end

  test "should get index" do
    get bears_url
    assert_response :success
  end

  test "should get new" do
    get new_bear_url
    assert_response :success
  end

  test "should create bear" do
    assert_difference("Bear.count") do
      post bears_url, params: { bear: { age: @bear.age, name: @bear.name } }
    end

    assert_redirected_to bear_url(Bear.last)
  end

  test "should show bear" do
    get bear_url(@bear)
    assert_response :success
  end

  test "should get edit" do
    get edit_bear_url(@bear)
    assert_response :success
  end

  test "should update bear" do
    patch bear_url(@bear), params: { bear: { age: @bear.age, name: @bear.name } }
    assert_redirected_to bear_url(@bear)
  end

  test "should destroy bear" do
    assert_difference("Bear.count", -1) do
      delete bear_url(@bear)
    end

    assert_redirected_to bears_url
  end
end
