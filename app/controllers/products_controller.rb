class ProductsController < ApplicationController
  before_action :authorize_request, only: [:create,:update]
  before_action :authorize_if_admin, only: [:create,:update]

  def index
    service = Products::ProductService.new(params)
    render json: Products::ProductBlueprint.render(service.list_products, view: :show)
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
      render json: Products::ProductBlueprint.render(result, view: :show)
    else
      render json: { error: 'Product not found' }, status: :not_found
    end
  end

  private

  def product_params
    params.permit(:title, :price, :description, :category_id,:sale_price, product_images_attributes: [:image])
  end

  def update_params
    params.permit(:id, :title, :price,:sale_price, :description, :category_id)
  end
end
