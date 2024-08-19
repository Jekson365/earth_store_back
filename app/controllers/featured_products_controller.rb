class FeaturedProductsController < ApplicationController
  def index
    @featured_products = FeaturedProduct.all

    render json: FeaturedProductsBlueprint.render(@featured_products, view: :normal)
  end

  def create
    featured = FeaturedProduct.new
    featured.product_id = featured_product_params[:product_id]
    if featured.save
      render json: featured
    end
  end

  def destroy
    featured = FeaturedProduct.find(featured_product_id[:id])
    if featured.destroy
      render json: featured
    end
  end

  private

  def featured_product_params
    params.permit(:product_id)
  end

  def featured_product_id
    params.permit(:id)
  end
end