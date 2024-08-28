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
    socials_links = params['_json']
    socials_links.each do |e|
      social = Social.find(e['id'])
      social.social_link = e['social_link']
      social.save
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
      params.permit(:title, :social_link)
    end
end
