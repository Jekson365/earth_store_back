class OpeningsController < ApplicationController
  before_action :set_opening, only: %i[ show update destroy ]

  # GET /openings
  def index
    @openings = Opening.all

    render json: @openings
  end

  # GET /openings/1
  def show
    render json: @opening
  end

  # POST /openings
  def create
    @opening = Opening.new(opening_params)

    if @opening.save
      render json: @opening, status: :created, location: @opening
    else
      render json: @opening.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /openings/1
  def update
    if @opening.update(opening_params)
      render json: @opening
    else
      render json: @opening.errors, status: :unprocessable_entity
    end
  end

  # DELETE /openings/1
  def destroy
    @opening.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_opening
      @opening = Opening.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def opening_params
      params.require(:opening).permit(:title, :min_title)
    end
end
