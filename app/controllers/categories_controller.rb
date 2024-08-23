class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :update, :destroy]

  def index
    categories = CategoryService.new.index
    render json: Categories::CategoriesBlueprint.render(categories)
  end

  def select_by_count
    result = ActiveRecord::Base.connection.execute('SELECT COUNT(category_id),categories.name,
      categories.id FROM categories LEFT JOIN products ON categories.id = products.category_id
      GROUP BY category_id,categories.name,categories.id')

    render json: result.as_json
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
    if CategoryService.new(nil, @category).destroy
      render json: 'removed!'
    else
      render json: @category.errors.full_messages
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
