require "test_helper"

class PostcardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @postcard = postcards(:one)
  end

  test "should get index" do
    get postcards_url, as: :json
    assert_response :success
  end

  test "should create postcard" do
    assert_difference("Postcard.count") do
      post postcards_url, params: { postcard: { min_title: @postcard.min_title, title: @postcard.title } }, as: :json
    end

    assert_response :created
  end

  test "should show postcard" do
    get postcard_url(@postcard), as: :json
    assert_response :success
  end

  test "should update postcard" do
    patch postcard_url(@postcard), params: { postcard: { min_title: @postcard.min_title, title: @postcard.title } }, as: :json
    assert_response :success
  end

  test "should destroy postcard" do
    assert_difference("Postcard.count", -1) do
      delete postcard_url(@postcard), as: :json
    end

    assert_response :no_content
  end
end
