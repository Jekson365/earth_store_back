require "test_helper"

class AboutsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @about = abouts(:one)
  end

  test "should get index" do
    get abouts_url, as: :json
    assert_response :success
  end

  test "should create abouts" do
    assert_difference("About.count") do
      post abouts_url, params: { about: { description: @about.description, title: @about.title } }, as: :json
    end

    assert_response :created
  end

  test "should show abouts" do
    get about_url(@about), as: :json
    assert_response :success
  end

  test "should update abouts" do
    patch about_url(@about), params: { about: { description: @about.description, title: @about.title } }, as: :json
    assert_response :success
  end

  test "should destroy abouts" do
    assert_difference("About.count", -1) do
      delete about_url(@about), as: :json
    end

    assert_response :no_content
  end
end
