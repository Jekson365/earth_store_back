class CartsController < ApplicationController
  def create
    cart = Cart.new
    cart.product_id = new_cart_params[:product_id]
    cart.user_id = new_cart_params[:user_id]
    cart.save

    render json: cart
  end

  def cart_items
    user_id = cart_index_params[:user_id]

    query = <<-SQL
    SELECT products.title, users.email, products.id as product_id, price, product_images.id as image_id,
    CONCAT('/uploads/product_image/image/', product_images.id, '/', product_images.image) as image_url,
    COUNT(products.id) as product_count FROM carts
    LEFT JOIN products ON carts.product_id = products.id
    LEFT JOIN users ON carts.user_id = users.id
    LEFT JOIN product_images ON products.id = product_images.product_id
    WHERE users.id = ? AND product_images.main = true
    GROUP BY products.id, products.title, users.email, price, image_url, product_images.id
  SQL

    result = ActiveRecord::Base.connection.execute(ActiveRecord::Base.send(:sanitize_sql_array, [query, user_id]))

    render json: result
  end

  def destroy_cart_items
    cart = Cart.find_by({ user_id: remove_cart_params[:user_id], product_id: remove_cart_params[:product_id] })
    if cart.destroy
      render json: cart
    end
  end

  private

  def new_cart_params
    params.permit(:product_id, :user_id)
  end

  def remove_cart_params
    params.permit(:product_id, :user_id)
  end

  def cart_index_params
    params.permit(:user_id)
  end
end
