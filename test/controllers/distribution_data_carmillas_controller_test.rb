require "test_helper"

class DistributionDataCarmillasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @distribution_data_carmilla = distribution_data_carmillas(:one)
  end

  test "should get index" do
    get distribution_data_carmillas_url
    assert_response :success
  end

  test "should get new" do
    get new_distribution_data_carmilla_url
    assert_response :success
  end

  test "should create distribution_data_carmilla" do
    assert_difference("DistributionDataCarmilla.count") do
      post distribution_data_carmillas_url, params: { distribution_data_carmilla: { frequency: @distribution_data_carmilla.frequency, ratio: @distribution_data_carmilla.ratio, words: @distribution_data_carmilla.words } }
    end

    assert_redirected_to distribution_data_carmilla_url(DistributionDataCarmilla.last)
  end

  test "should show distribution_data_carmilla" do
    get distribution_data_carmilla_url(@distribution_data_carmilla)
    assert_response :success
  end

  test "should get edit" do
    get edit_distribution_data_carmilla_url(@distribution_data_carmilla)
    assert_response :success
  end

  test "should update distribution_data_carmilla" do
    patch distribution_data_carmilla_url(@distribution_data_carmilla), params: { distribution_data_carmilla: { frequency: @distribution_data_carmilla.frequency, ratio: @distribution_data_carmilla.ratio, words: @distribution_data_carmilla.words } }
    assert_redirected_to distribution_data_carmilla_url(@distribution_data_carmilla)
  end

  test "should destroy distribution_data_carmilla" do
    assert_difference("DistributionDataCarmilla.count", -1) do
      delete distribution_data_carmilla_url(@distribution_data_carmilla)
    end

    assert_redirected_to distribution_data_carmillas_url
  end
end
