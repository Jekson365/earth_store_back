require "test_helper"

class AdditionalTextsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @additional_text = additional_texts(:one)
  end

  test "should get index" do
    get additional_texts_url, as: :json
    assert_response :success
  end

  test "should create additional_text" do
    assert_difference("AdditionalText.count") do
      post additional_texts_url, params: { additional_text: { description: @additional_text.description } }, as: :json
    end

    assert_response :created
  end

  test "should show additional_text" do
    get additional_text_url(@additional_text), as: :json
    assert_response :success
  end

  test "should update additional_text" do
    patch additional_text_url(@additional_text), params: { additional_text: { description: @additional_text.description } }, as: :json
    assert_response :success
  end

  test "should destroy additional_text" do
    assert_difference("AdditionalText.count", -1) do
      delete additional_text_url(@additional_text), as: :json
    end

    assert_response :no_content
  end
end
