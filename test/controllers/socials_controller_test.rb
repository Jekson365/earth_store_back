require "test_helper"

class SocialsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @social = socials(:one)
  end

  test "should get index" do
    get socials_url, as: :json
    assert_response :success
  end

  test "should create social" do
    assert_difference("Social.count") do
      post socials_url, params: { social: { social_link: @social.social_link, title: @social.title } }, as: :json
    end

    assert_response :created
  end

  test "should show social" do
    get social_url(@social), as: :json
    assert_response :success
  end

  test "should update social" do
    patch social_url(@social), params: { social: { social_link: @social.social_link, title: @social.title } }, as: :json
    assert_response :success
  end

  test "should destroy social" do
    assert_difference("Social.count", -1) do
      delete social_url(@social), as: :json
    end

    assert_response :no_content
  end
end
