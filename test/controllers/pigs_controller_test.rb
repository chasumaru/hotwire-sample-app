require "test_helper"

class PigsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pig = pigs(:one)
  end

  test "should get index" do
    get pigs_url
    assert_response :success
  end

  test "should get new" do
    get new_pig_url
    assert_response :success
  end

  test "should create pig" do
    assert_difference("Pig.count") do
      post pigs_url, params: { pig: { age: @pig.age, name: @pig.name } }
    end

    assert_redirected_to pig_url(Pig.last)
  end

  test "should show pig" do
    get pig_url(@pig)
    assert_response :success
  end

  test "should get edit" do
    get edit_pig_url(@pig)
    assert_response :success
  end

  test "should update pig" do
    patch pig_url(@pig), params: { pig: { age: @pig.age, name: @pig.name } }
    assert_redirected_to pig_url(@pig)
  end

  test "should destroy pig" do
    assert_difference("Pig.count", -1) do
      delete pig_url(@pig)
    end

    assert_redirected_to pigs_url
  end
end
