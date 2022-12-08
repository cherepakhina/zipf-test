require "test_helper"

class DistributionDataLovecrsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @distribution_data_lovecr = distribution_data_lovecrs(:one)
  end

  test "should get index" do
    get distribution_data_lovecrs_url
    assert_response :success
  end

  test "should get new" do
    get new_distribution_data_lovecr_url
    assert_response :success
  end

  test "should create distribution_data_lovecr" do
    assert_difference("DistributionDataLovecr.count") do
      post distribution_data_lovecrs_url, params: { distribution_data_lovecr: { frequency: @distribution_data_lovecr.frequency, ratio: @distribution_data_lovecr.ratio, words: @distribution_data_lovecr.words } }
    end

    assert_redirected_to distribution_data_lovecr_url(DistributionDataLovecr.last)
  end

  test "should show distribution_data_lovecr" do
    get distribution_data_lovecr_url(@distribution_data_lovecr)
    assert_response :success
  end

  test "should get edit" do
    get edit_distribution_data_lovecr_url(@distribution_data_lovecr)
    assert_response :success
  end

  test "should update distribution_data_lovecr" do
    patch distribution_data_lovecr_url(@distribution_data_lovecr), params: { distribution_data_lovecr: { frequency: @distribution_data_lovecr.frequency, ratio: @distribution_data_lovecr.ratio, words: @distribution_data_lovecr.words } }
    assert_redirected_to distribution_data_lovecr_url(@distribution_data_lovecr)
  end

  test "should destroy distribution_data_lovecr" do
    assert_difference("DistributionDataLovecr.count", -1) do
      delete distribution_data_lovecr_url(@distribution_data_lovecr)
    end

    assert_redirected_to distribution_data_lovecrs_url
  end
end
