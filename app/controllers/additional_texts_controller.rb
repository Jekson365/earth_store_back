class AdditionalTextsController < ApplicationController
  before_action :set_additional_text, only: %i[ show update destroy ]

  def index
    @additional_texts = AdditionalText.all

    render json: @additional_texts
  end

  def show
    render json: @additional_text
  end

  def create
    @additional_text = AdditionalText.new(additional_text_params)

    if @additional_text.save
      render json: @additional_text, status: :created, location: @additional_text
    else
      render json: @additional_text.errors, status: :unprocessable_entity
    end
  end

  def update
    if @additional_text.update(additional_text_params)
      render json: @additional_text
    else
      render json: @additional_text.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @additional_text.destroy!
  end

  private
    def set_additional_text
      @additional_text = AdditionalText.find(params[:id])
    end

    def additional_text_params
      params.require(:additional_text).permit(:description)
    end
end
