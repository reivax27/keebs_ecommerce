class ProductsController < ApplicationController
  def index
    @products = Product.order('name').page(params[:page])
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    id = params[:id].to_i
    quantity = params[:quantity].to_i
    # unless session[:shopping_cart].include?(id)
    #   # session[:shopping_cart] << OrderDetail.new(
    #   #                               product_id: id,
    #   #                               quantity: quantity,
    #   #                               priceOnOrder: Product.find(id).price
    #   #                             )

    #   session[:shopping_cart] << { 'id' => id, 'quantity' => quantity }
    #   # session[:shopping_cart] << id
    # end

    if session[:shopping_cart].count.zero? && quantity > 0
      session[:shopping_cart] << { 'id' => id, 'quantity' => quantity }
    else
      unless session[:shopping_cart].any? { |item| item['id'].to_i == id }
        session[:shopping_cart] << { 'id' => id, 'quantity' => quantity }
      end
    end

    redirect_to root_path
  end

  def update_cart
    id = params[:id].to_i
    quantity = params[:quantity].to_i
    session[:shopping_cart].each do |item|
      if item['id'].to_i == id
        item['quantity'] = quantity
      end
    end
    redirect_back fallback_location: '/cart'
  end

  def remove_from_cart
    id = params[:id].to_i
    # session[:shopping_cart].delete(id)
    # session[:shopping_cart].each do |item|
    #   item['id'].include? id
    # end
    # this actually works POGGERS
    session[:shopping_cart].delete_if { |item| item['id'] == id }
    redirect_back fallback_location: '/cart'
  end

  def clear_cart
    session[:shopping_cart] = []
    session[:subtotal] = []
    redirect_to root_path
  end
end
