require "test_helper"

class DeersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @deer = deers(:one)
  end

  test "should get index" do
    get deers_url
    assert_response :success
  end

  test "should get new" do
    get new_deer_url
    assert_response :success
  end

  test "should create deer" do
    assert_difference("Deer.count") do
      post deers_url, params: { deer: { age: @deer.age, name: @deer.name } }
    end

    assert_redirected_to deer_url(Deer.last)
  end

  test "should show deer" do
    get deer_url(@deer)
    assert_response :success
  end

  test "should get edit" do
    get edit_deer_url(@deer)
    assert_response :success
  end

  test "should update deer" do
    patch deer_url(@deer), params: { deer: { age: @deer.age, name: @deer.name } }
    assert_redirected_to deer_url(@deer)
  end

  test "should destroy deer" do
    assert_difference("Deer.count", -1) do
      delete deer_url(@deer)
    end

    assert_redirected_to deers_url
  end
end
