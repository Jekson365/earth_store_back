# app/services/product_service.rb

module Products
  class ProductService
    def initialize(params)
      @params = params
    end

    def create_product
      product = Product.new(product_params)
      if product.save
        product
      else
        product.errors.full_messages
      end
    end

    def update_product
      product = Product.find(@params[:id])
      if product.update(update_params)
        product
      else
        product.errors.full_messages
      end
    end

    def destroy_product
      product = Product.find(@params[:id])
      if product.destroy!
        product
      else
        product.errors.full_messages
      end
    end

    def show_product
      Product.find(@params[:id])
    end

    def list_products
      Product.all
    end

    private

    def product_params
      @params.permit(:title, :price, :description, :category_id, :sale_price, :amount, product_images_attributes: [:image])
    end

    def update_params
      @params.permit(:id, :title, :price, :description, :sale_price, :amount, :category_id)
    end
  end
end
