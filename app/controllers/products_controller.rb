class ProductsController < ApplicationController
  before_action :authorize_request
  before_action :authorize_if_admin

  def index
    service = Products::ProductService.new(params)
    render json: Products::ProductBlueprint.render(service.list_products,view: :show)
  end

  def create
    service = Products::ProductService.new(params)
    result = service.create_product
    if result.is_a?(Product)
      render json: result
    else
      render json: result
    end
  end

  def update
    service = Products::ProductService.new(params)
    result = service.update_product
    if result.is_a?(Product)
      render json: result
    else
      render json: result
    end
  end

  def destroy
    service = Products::ProductService.new(params)
    result = service.destroy_product
    if result.is_a?(Product)
      render json: result
    else
      render json: result
    end
  end

  def show
    service = Products::ProductService.new(params)
    result = service.show_product
    if result
      render json: Products::ProductBlueprint.render(result,view: :show)
    else
      render json: { error: 'Product not found' }, status: :not_found
    end
  end

  private

  def product_params
    params.permit(:title, :price, :description, :category_id, product_images_attributes: [:image])
  end

  def update_params
    params.permit(:id, :title, :price, :description, :category_id)
  end
end
