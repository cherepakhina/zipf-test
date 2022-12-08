require "application_system_test_case"

class TextsForZipfsTest < ApplicationSystemTestCase
  setup do
    @texts_for_zipf = texts_for_zipfs(:one)
  end

  test "visiting the index" do
    visit texts_for_zipfs_url
    assert_selector "h1", text: "Texts for zipfs"
  end

  test "should create texts for zipf" do
    visit texts_for_zipfs_url
    click_on "New texts for zipf"

    fill_in "Text file", with: @texts_for_zipf.text_file
    fill_in "Text name", with: @texts_for_zipf.text_name
    click_on "Create Texts for zipf"

    assert_text "Texts for zipf was successfully created"
    click_on "Back"
  end

  test "should update Texts for zipf" do
    visit texts_for_zipf_url(@texts_for_zipf)
    click_on "Edit this texts for zipf", match: :first

    fill_in "Text file", with: @texts_for_zipf.text_file
    fill_in "Text name", with: @texts_for_zipf.text_name
    click_on "Update Texts for zipf"

    assert_text "Texts for zipf was successfully updated"
    click_on "Back"
  end

  test "should destroy Texts for zipf" do
    visit texts_for_zipf_url(@texts_for_zipf)
    click_on "Destroy this texts for zipf", match: :first

    assert_text "Texts for zipf was successfully destroyed"
  end
end
