require "test_helper"

class OpeningsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @opening = openings(:one)
  end

  test "should get index" do
    get openings_url, as: :json
    assert_response :success
  end

  test "should create opening" do
    assert_difference("Opening.count") do
      post openings_url, params: { opening: { min_title: @opening.min_title, title: @opening.title } }, as: :json
    end

    assert_response :created
  end

  test "should show opening" do
    get opening_url(@opening), as: :json
    assert_response :success
  end

  test "should update opening" do
    patch opening_url(@opening), params: { opening: { min_title: @opening.min_title, title: @opening.title } }, as: :json
    assert_response :success
  end

  test "should destroy opening" do
    assert_difference("Opening.count", -1) do
      delete opening_url(@opening), as: :json
    end

    assert_response :no_content
  end
end
