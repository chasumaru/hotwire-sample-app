require "application_system_test_case"

class BearsTest < ApplicationSystemTestCase
  setup do
    @bear = bears(:one)
  end

  test "visiting the index" do
    visit bears_url
    assert_selector "h1", text: "Bears"
  end

  test "should create bear" do
    visit bears_url
    click_on "New bear"

    fill_in "Age", with: @bear.age
    fill_in "Name", with: @bear.name
    click_on "Create Bear"

    assert_text "Bear was successfully created"
    click_on "Back"
  end

  test "should update Bear" do
    visit bear_url(@bear)
    click_on "Edit this bear", match: :first

    fill_in "Age", with: @bear.age
    fill_in "Name", with: @bear.name
    click_on "Update Bear"

    assert_text "Bear was successfully updated"
    click_on "Back"
  end

  test "should destroy Bear" do
    visit bear_url(@bear)
    click_on "Destroy this bear", match: :first

    assert_text "Bear was successfully destroyed"
  end
end
