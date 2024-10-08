class OpeningsController < ApplicationController
  before_action :set_opening, only: %i[ show update destroy ]
  before_action :authorize_request,only: [:update]
  before_action :authorize_if_admin,only: [:update]

  # GET /openings
  def index
    locale = params[:locale]
    view = locale == 'ka' ? :normal_ka : :normal
    @openings = OpeningBlueprint.render(Opening.first,view: view)

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
    params.require(:opening).permit(
      :title,
      :min_title,
      :min_title_ka,
      :title_ka,
      opening_images_attributes: [:id, :image, :_destroy]
    )
  end
end
