class ShopSlidersController < ApplicationController
  def create
    shop_slider = ShopSlider.new(shop_sliders_params)
    if shop_slider.save
      render json: shop_slider
    end
  end

  def index
    shop_sliders = ShopSlider.all
    render json: shop_sliders
  end

  def destroy
    shop_slider = ShopSlider.find(params[:id])
    shop_slider.destroy
  end

  private

  def shop_sliders_params
    params.permit(:header, :image)
  end
end
