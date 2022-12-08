require "test_helper"

class TextsForZipfsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @texts_for_zipf = texts_for_zipfs(:one)
  end

  test "should get index" do
    get texts_for_zipfs_url
    assert_response :success
  end

  test "should get new" do
    get new_texts_for_zipf_url
    assert_response :success
  end

  test "should create texts_for_zipf" do
    assert_difference("TextsForZipf.count") do
      post texts_for_zipfs_url, params: { texts_for_zipf: { text_file: @texts_for_zipf.text_file, text_name: @texts_for_zipf.text_name } }
    end

    assert_redirected_to texts_for_zipf_url(TextsForZipf.last)
  end

  test "should show texts_for_zipf" do
    get texts_for_zipf_url(@texts_for_zipf)
    assert_response :success
  end

  test "should get edit" do
    get edit_texts_for_zipf_url(@texts_for_zipf)
    assert_response :success
  end

  test "should update texts_for_zipf" do
    patch texts_for_zipf_url(@texts_for_zipf), params: { texts_for_zipf: { text_file: @texts_for_zipf.text_file, text_name: @texts_for_zipf.text_name } }
    assert_redirected_to texts_for_zipf_url(@texts_for_zipf)
  end

  test "should destroy texts_for_zipf" do
    assert_difference("TextsForZipf.count", -1) do
      delete texts_for_zipf_url(@texts_for_zipf)
    end

    assert_redirected_to texts_for_zipfs_url
  end
end
