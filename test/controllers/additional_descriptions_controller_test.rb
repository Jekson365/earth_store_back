require "test_helper"

class AdditionalDescriptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @additional_description = additional_descriptions(:one)
  end

  test "should get index" do
    get additional_descriptions_url, as: :json
    assert_response :success
  end

  test "should create additional_description" do
    assert_difference("AdditionalDescription.count") do
      post additional_descriptions_url, params: { additional_description: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show additional_description" do
    get additional_description_url(@additional_description), as: :json
    assert_response :success
  end

  test "should update additional_description" do
    patch additional_description_url(@additional_description), params: { additional_description: {  } }, as: :json
    assert_response :success
  end

  test "should destroy additional_description" do
    assert_difference("AdditionalDescription.count", -1) do
      delete additional_description_url(@additional_description), as: :json
    end

    assert_response :no_content
  end
end
