class SocialsController < ApplicationController
  before_action :set_social, only: %i[ show update destroy ]

  # GET /socials
  def index
    @socials = Social.all

    render json: @socials
  end

  # GET /socials/1
  def show
    render json: @social
  end

  # POST /socials
  def create
    @social = Social.new(social_params)

    if @social.save
      render json: @social, status: :created, location: @social
    else
      render json: @social.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /socials/1
  def update
    if @social.update(social_params)
      render json: @social
    else
      render json: @social.errors, status: :unprocessable_entity
    end
  end

  # DELETE /socials/1
  def destroy
    @social.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_social
      @social = Social.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def social_params
      params.require(:social).permit(:title, :social_link)
    end
end
