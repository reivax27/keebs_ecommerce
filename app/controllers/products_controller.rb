class ProductsController < ApplicationController
  def index
    @products = Product.order('name').page(params[:page])
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    id = params[:id].to_i
    quantity = 5
    unless session[:shopping_cart].include?(id)
      # session[:shopping_cart] << OrderDetail.new(
      #                               product_id: id,
      #                               quantity: quantity,
      #                               priceOnOrder: Product.find(id).price
      #                             )

      session[:shopping_cart] << { 'id' => id, 'quantity' => quantity }
      # session[:shopping_cart] << id
    end
    redirect_to root_path
  end

  def remove_from_cart
    id = params[:id].to_i
    session[:shopping_cart].delete(id)
    redirect_back fallback_location: '/cart'
  end

  def clear_cart
    session[:shopping_cart] = []
    redirect_to root_path
  end
end
