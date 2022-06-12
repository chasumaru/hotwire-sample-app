require "application_system_test_case"

class PigsTest < ApplicationSystemTestCase
  setup do
    @pig = pigs(:one)
  end

  test "visiting the index" do
    visit pigs_url
    assert_selector "h1", text: "Pigs"
  end

  test "should create pig" do
    visit pigs_url
    click_on "New pig"

    fill_in "Age", with: @pig.age
    fill_in "Name", with: @pig.name
    click_on "Create Pig"

    assert_text "Pig was successfully created"
    click_on "Back"
  end

  test "should update Pig" do
    visit pig_url(@pig)
    click_on "Edit this pig", match: :first

    fill_in "Age", with: @pig.age
    fill_in "Name", with: @pig.name
    click_on "Update Pig"

    assert_text "Pig was successfully updated"
    click_on "Back"
  end

  test "should destroy Pig" do
    visit pig_url(@pig)
    click_on "Destroy this pig", match: :first

    assert_text "Pig was successfully destroyed"
  end
end
