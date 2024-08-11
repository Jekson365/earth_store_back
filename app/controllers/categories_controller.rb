class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :update, :destroy]

  def index
    categories = CategoryService.new.index
    render json: Categories::CategoriesBlueprint.render(categories)
  end

  def show
    render json: Categories::CategoriesBlueprint.render(CategoryService.new(nil, @category).show)
  end

  def create
    result = CategoryService.new(category_params).create
    if result.is_a?(Category)
      render json: Categories::CategoriesBlueprint.render(result), status: :created
    else
      render json: result, status: :unprocessable_entity
    end
  end

  def update
    result = CategoryService.new(category_params, @category).update
    if result.is_a?(Category)
      render json: Categories::CategoriesBlueprint.render(result)
    else
      render json: result, status: :unprocessable_entity
    end
  end

  def destroy
    CategoryService.new(nil, @category).destroy
    head :no_content
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
