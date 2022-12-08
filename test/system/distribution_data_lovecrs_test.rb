require "application_system_test_case"

class DistributionDataLovecrsTest < ApplicationSystemTestCase
  setup do
    @distribution_data_lovecr = distribution_data_lovecrs(:one)
  end

  test "visiting the index" do
    visit distribution_data_lovecrs_url
    assert_selector "h1", text: "Distribution data lovecrs"
  end

  test "should create distribution data lovecr" do
    visit distribution_data_lovecrs_url
    click_on "New distribution data lovecr"

    fill_in "Frequency", with: @distribution_data_lovecr.frequency
    fill_in "Ratio", with: @distribution_data_lovecr.ratio
    fill_in "Words", with: @distribution_data_lovecr.words
    click_on "Create Distribution data lovecr"

    assert_text "Distribution data lovecr was successfully created"
    click_on "Back"
  end

  test "should update Distribution data lovecr" do
    visit distribution_data_lovecr_url(@distribution_data_lovecr)
    click_on "Edit this distribution data lovecr", match: :first

    fill_in "Frequency", with: @distribution_data_lovecr.frequency
    fill_in "Ratio", with: @distribution_data_lovecr.ratio
    fill_in "Words", with: @distribution_data_lovecr.words
    click_on "Update Distribution data lovecr"

    assert_text "Distribution data lovecr was successfully updated"
    click_on "Back"
  end

  test "should destroy Distribution data lovecr" do
    visit distribution_data_lovecr_url(@distribution_data_lovecr)
    click_on "Destroy this distribution data lovecr", match: :first

    assert_text "Distribution data lovecr was successfully destroyed"
  end
end
