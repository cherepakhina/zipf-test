require "application_system_test_case"

class DistributionDataCarmillasTest < ApplicationSystemTestCase
  setup do
    @distribution_data_carmilla = distribution_data_carmillas(:one)
  end

  test "visiting the index" do
    visit distribution_data_carmillas_url
    assert_selector "h1", text: "Distribution data carmillas"
  end

  test "should create distribution data carmilla" do
    visit distribution_data_carmillas_url
    click_on "New distribution data carmilla"

    fill_in "Frequency", with: @distribution_data_carmilla.frequency
    fill_in "Ratio", with: @distribution_data_carmilla.ratio
    fill_in "Words", with: @distribution_data_carmilla.words
    click_on "Create Distribution data carmilla"

    assert_text "Distribution data carmilla was successfully created"
    click_on "Back"
  end

  test "should update Distribution data carmilla" do
    visit distribution_data_carmilla_url(@distribution_data_carmilla)
    click_on "Edit this distribution data carmilla", match: :first

    fill_in "Frequency", with: @distribution_data_carmilla.frequency
    fill_in "Ratio", with: @distribution_data_carmilla.ratio
    fill_in "Words", with: @distribution_data_carmilla.words
    click_on "Update Distribution data carmilla"

    assert_text "Distribution data carmilla was successfully updated"
    click_on "Back"
  end

  test "should destroy Distribution data carmilla" do
    visit distribution_data_carmilla_url(@distribution_data_carmilla)
    click_on "Destroy this distribution data carmilla", match: :first

    assert_text "Distribution data carmilla was successfully destroyed"
  end
end
