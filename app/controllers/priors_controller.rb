class PriorsController < ApplicationController
  before_action :set_prior, only: %i[ show update destroy ]

  # GET /priors
  def index
    @priors = Prior.all

    render json: @priors
  end

  # GET /priors/1
  def show
    render json: @prior
  end

  # POST /priors
  def create
    @prior = Prior.new(prior_params)

    if @prior.save
      render json: @prior, status: :created, location: @prior
    else
      render json: @prior.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /priors/1
  def update
    if @prior.update(prior_params)
      render json: @prior
    else
      render json: @prior.errors, status: :unprocessable_entity
    end
  end

  # DELETE /priors/1
  def destroy
    @prior.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_prior
    @prior = Prior.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def prior_params
    params.require(:prior).permit(:title, :description, :icon_id)
  end
end
