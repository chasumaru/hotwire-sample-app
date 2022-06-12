require "application_system_test_case"

class DeersTest < ApplicationSystemTestCase
  setup do
    @deer = deers(:one)
  end

  test "visiting the index" do
    visit deers_url
    assert_selector "h1", text: "Deers"
  end

  test "should create deer" do
    visit deers_url
    click_on "New deer"

    fill_in "Age", with: @deer.age
    fill_in "Name", with: @deer.name
    click_on "Create Deer"

    assert_text "Deer was successfully created"
    click_on "Back"
  end

  test "should update Deer" do
    visit deer_url(@deer)
    click_on "Edit this deer", match: :first

    fill_in "Age", with: @deer.age
    fill_in "Name", with: @deer.name
    click_on "Update Deer"

    assert_text "Deer was successfully updated"
    click_on "Back"
  end

  test "should destroy Deer" do
    visit deer_url(@deer)
    click_on "Destroy this deer", match: :first

    assert_text "Deer was successfully destroyed"
  end
end
