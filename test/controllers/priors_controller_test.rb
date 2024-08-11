require "test_helper"

class PriorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @prior = priors(:one)
  end

  test "should get index" do
    get priors_url, as: :json
    assert_response :success
  end

  test "should create prior" do
    assert_difference("Prior.count") do
      post priors_url, params: { prior: { description: @prior.description, title: @prior.title } }, as: :json
    end

    assert_response :created
  end

  test "should show prior" do
    get prior_url(@prior), as: :json
    assert_response :success
  end

  test "should update prior" do
    patch prior_url(@prior), params: { prior: { description: @prior.description, title: @prior.title } }, as: :json
    assert_response :success
  end

  test "should destroy prior" do
    assert_difference("Prior.count", -1) do
      delete prior_url(@prior), as: :json
    end

    assert_response :no_content
  end
end
