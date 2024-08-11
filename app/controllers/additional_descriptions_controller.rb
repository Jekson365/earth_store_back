class AdditionalDescriptionsController < ApplicationController
  before_action :set_additional_description, only: %i[show update destroy]

  def index
    @additional_descriptions = AdditionalDescription.all
    render json: @additional_descriptions
  end

  def show
    render json: @additional_description
  end

  def create
    @additional_description = AdditionalDescription.new(additional_description_params)

    if @additional_description.save
      render json: @additional_description, status: :created, location: @additional_description
    else
      render json: @additional_description.errors, status: :unprocessable_entity
    end
  end

  def update
    if @additional_description.update(additional_description_params)
      render json: @additional_description
    else
      render json: @additional_description.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @additional_description.destroy
    head :no_content
  end

  private

  def set_additional_description
    @additional_description = AdditionalDescription.find(params[:id])
  end

  def additional_description_params
    params.require(:additional_description).permit(:title, :product_id, additional_texts_attributes: [:description])
  end
end
