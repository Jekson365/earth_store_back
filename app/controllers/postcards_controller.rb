class PostcardsController < ApplicationController
  before_action :set_postcard, only: %i[ show update destroy ]

  # GET /postcards
  def index
    @postcards = Postcard.first

    render json: @postcards
  end

  # GET /postcards/1
  def show
    render json: @postcard
  end

  # POST /postcards
  def create
    @postcard = Postcard.new(postcard_params)

    if @postcard.save
      render json: @postcard, status: :created, location: @postcard
    else
      render json: @postcard.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /postcards/1
  def update
    if @postcard.update(postcard_params)
      render json: @postcard
    else
      render json: @postcard.errors, status: :unprocessable_entity
    end
  end

  # DELETE /postcards/1
  def destroy
    @postcard.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_postcard
      @postcard = Postcard.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def postcard_params
      params.require(:postcard).permit(:title, :min_title,:image)
    end
end
